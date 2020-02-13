import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_chat/model/user_model.dart';
import 'package:flutter_chat/services/firebase_service.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_chat/services/notifications_service.dart';

part "auth_store.g.dart";

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseService _firebaseService;
  final NotificationsService _notificationsService;

  @observable
  bool didVerifyIsLoggedIn = false;

  @observable
  bool isFetching = false;

  @observable
  String email = "";
  @observable
  String password = "";
  @observable
  String errorMessage = "";

  @observable
  UserModel currentUser;

  _AuthStore(
    this._firebaseService,
    this._notificationsService,
  ) {
    this.verifyIsLoggedIn();
  }

  @action
  setDidVerifyIsLoggedIn(bool newValue) => this.didVerifyIsLoggedIn = newValue;
  @action
  setIsFetching(bool newValue) => this.isFetching = newValue;

  @action
  setEmail(String newValue) => this.email = newValue;
  @action
  setPassword(String newValue) => this.password = newValue;
  @action
  setErrorMessage(String newValue) => this.errorMessage = newValue ?? "";

  @action
  setCurrentUser(UserModel newValue) {
    this.currentUser = newValue;
    print("setCurrentUser ${newValue == null}");
    if (newValue != null) {
      print("token: ${newValue.token}");
      print("nome: ${newValue.name}");
      print("email: ${newValue.email}");
      print("isAdmin: ${newValue.isAdmin}");
      print("isAnonymous: ${newValue.isAnonymous}");
    }
  }

  @computed
  bool get isAuthenticated => this.currentUser != null;
  @computed
  String get currentUserToken =>
      this.currentUser != null ? this.currentUser.token : null;

  clearStore() {
    this.setEmail("");
    this.setPassword("");
    this.setIsFetching(false);
    this.setCurrentUser(null);
    this.setErrorMessage("");
  }

  appUserFromFirebaseUser(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) return null;

    bool isAdmin = false;

    var ref = _firebaseService.database
        .reference()
        .child("users/${firebaseUser.uid}");
    DataSnapshot snapshot = await ref.once();
    print("snapshot.value  ${snapshot.value}");
    if (snapshot.value == null) {
      ref.set({
        "isAnonymous": firebaseUser.isAnonymous,
        "isAdmin": false,
        "createdAt": _firebaseService.serverTimestamp
      });
    } else {
      isAdmin = snapshot.value["isAdmin"] ?? false;
    }

    return UserModel(
      email: firebaseUser.email,
      name: firebaseUser.displayName,
      token: firebaseUser.uid,
      isAdmin: isAdmin,
      isAnonymous: firebaseUser.isAnonymous,
    );
  }

  verifyIsLoggedIn() async {
    FirebaseUser firebaseUser = await this.getFirebaseUser();
    var user = await appUserFromFirebaseUser(firebaseUser);
    this.setCurrentUser(user);
    this.setDidVerifyIsLoggedIn(true);
  }

  submitLogin() {
    this.setIsFetching(true);
    // TODO: substituir fake abaixo por autenticação do Firebase
    Future.delayed(Duration(seconds: 3), () {
      var user = UserModel(
        name: "Test user",
        email: "user@test.com",
        token: "user1",
        isAnonymous: false,
        isAdmin: true,
      );

      this._notificationsService.notifySuccess("Bem vindo!");
      this.setCurrentUser(user);
      this.setIsFetching(false);
    });
  }

  Future<FirebaseUser> getFirebaseUser() async {
    return await this._firebaseService.auth.currentUser();
  }

  anonymousLogin() async {
    this.setIsFetching(true);
    FirebaseUser firebaseUser = await this.getFirebaseUser();

    try {
      if (firebaseUser == null) {
        var authResult = await this._firebaseService.auth.signInAnonymously();
        if (authResult.user != null) {
          firebaseUser = authResult.user;
        }
      }
    } catch (e) {
      print("error on anonymousLogin");
      print(e);
    }

    this.setCurrentUser(await this.appUserFromFirebaseUser(firebaseUser));
    this.setIsFetching(false);
  }

  void logout() {
    this.clearStore();
  }
}
