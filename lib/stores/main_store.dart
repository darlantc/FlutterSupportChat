import 'package:flutter_chat/routes/app_routes.dart';
import 'package:flutter_chat/stores/settings_store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_chat/services/notifications_service.dart';

import "./auth_store.dart";

class MainStore {
  AuthStore authStore;
  SettingsStore settingsStore;

  MainStore() {
    NotificationsService notificationsService = NotificationsService();

    // Set Stores
    this.settingsStore = SettingsStore();

    this.authStore = AuthStore(
      // firebaseAuth,
      notificationsService,
    );

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
  }
}
