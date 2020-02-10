import 'package:flutter_chat/model/user_model.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_chat/services/notifications_service.dart';

part "auth_store.g.dart";

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
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
    if (newValue != null) {
      this._notificationsService.notifySuccess("Bem vindo!");
    } else {
      this._notificationsService.notifySuccess("Até logo!");
    }
  }

  @computed
  bool get isAuthenticated => this.currentUser != null;
  @computed
  String get currentUserToken =>
      this.currentUser != null ? this.currentUser.token : null;

  verifyIsLoggedIn() {
    // TODO: criar lógica para verificar se usuário já está logado
    Future.delayed(Duration(seconds: 2), () {
      this.setDidVerifyIsLoggedIn(true);
    });
  }

  submitLogin() {
    this.setIsFetching(true);
    // TODO: substituir fake abaixo por autenticação do Firebase
    Future.delayed(Duration(seconds: 3), () {
      var user = UserModel(
        name: "Test user",
        email: "user@test.com",
        token: "user1",
        isAdmin: true,
      );

      this.setCurrentUser(user);
      this.setIsFetching(false);
    });
  }

  clearStore() {
    this.setEmail("");
    this.setPassword("");
    this.setIsFetching(false);
    this.setCurrentUser(null);
    this.setErrorMessage("");
  }

  void logout() {
    this.clearStore();
  }
}
