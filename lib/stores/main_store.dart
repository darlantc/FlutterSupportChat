import 'package:flutter_chat/routes/app_routes.dart';
import 'package:flutter_chat/stores/chat_store.dart';
import 'package:flutter_chat/stores/settings_store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_chat/services/notifications_service.dart';

import "./auth_store.dart";

class MainStore {
  AuthStore authStore;
  ChatStore chatStore;
  SettingsStore settingsStore;

  MainStore() {
    NotificationsService notificationsService = NotificationsService();

    // Set Stores
    this.settingsStore = SettingsStore();

    this.authStore = AuthStore(
      // firebaseAuth,
      notificationsService,
    );

    this.chatStore = ChatStore();

    setReactions();
  }

  setReactions() {
    reaction(
      (_) {
        print(
            "this.authStore.didVerifyIsLoggedIn ${this.authStore.didVerifyIsLoggedIn}");
        if (this.authStore.didVerifyIsLoggedIn) {
          return this.authStore.isAuthenticated;
        }
        return false;
      },
      (bool isAuthenticated) {
        print("isAuthenticated $isAuthenticated");
        if (isAuthenticated) {
          Get.offAllNamed(pathForRoute(APP_ROUTE.HOME), (route) => false);
        } else {
          Get.offAllNamed(pathForRoute(APP_ROUTE.LOGIN), (route) => false);
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
        Get.toNamed("${pathForRoute(APP_ROUTE.CHAT)}$selectedChatId");
      } else {
        Get.back();
      }
    });
  }
}
