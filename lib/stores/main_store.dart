import 'package:flutter_chat/routes/app_routes.dart';
import 'package:flutter_chat/services/firebase_service.dart';
import 'package:flutter_chat/stores/chat_store.dart';
import 'package:flutter_chat/stores/settings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_chat/services/notifications_service.dart';

import "./auth_store.dart";

class MainStore {
  AuthStore authStore;
  ChatStore chatStore;
  SettingsStore settingsStore;

  MainStore(FirebaseService firebaseService) {
    NotificationsService notificationsService = NotificationsService();

    // Set Stores
    this.settingsStore = SettingsStore();

    this.authStore = AuthStore(
      firebaseService,
      notificationsService,
    );

    this.chatStore = ChatStore();

    setReactions();
  }

  setReactions() {
    reaction(
      (_) {
        if (this.authStore.didVerifyIsLoggedIn) {
          return this.authStore.isAuthenticated;
        }
        return false;
      },
      (bool isAuthenticated) {
        print("isAuthenticated $isAuthenticated");
        if (isAuthenticated) {
          Modular.to.pushNamedAndRemoveUntil(
              pathForRoute(APP_ROUTE.CHATS_LIST), (_) => false);
        } else {
          Modular.to.pushNamedAndRemoveUntil(
              pathForRoute(APP_ROUTE.LOGIN), (_) => false);
        }
      },
      fireImmediately: true,
    );

    reaction((_) => this.authStore.isAuthenticated, (bool isAuthenticated) {
      if (isAuthenticated) {
        this.chatStore.setIsAdminView(this.authStore.currentUser.isAdmin);
        this.chatStore.getChatsList();
      } else {
        this.chatStore.clearStore();
      }
    });
    reaction((_) => this.chatStore.selectedChatId, (String selectedChatId) {
      if (selectedChatId != null) {
        Modular.to.pushNamed("${pathForRoute(APP_ROUTE.CHAT)}$selectedChatId");
      } else {
        Modular.to.pop();
      }
    });
  }
}
