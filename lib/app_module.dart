import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/pages/home_page.dart';
import 'package:flutter_chat/routes/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_chat/services/notifications_service.dart';
import 'package:flutter_chat/stores/main_store.dart';

import './app.dart';

class AppModule extends MainModule {
  NotificationsService notificationsService = NotificationsService();

  MainStore mainStore = MainStore();

  @override
  List<Bind> get binds => [
        Bind((i) => notificationsService),
        Bind((i) => mainStore.authStore),
        Bind((i) => mainStore.settingsStore),
      ];

  @override
  List<Router> get routers => [
        Router(
          pathForRoute(APP_ROUTE.LOGIN),
          child: (_, args) => LoginPage(),
        ),
        Router(
          pathForRoute(APP_ROUTE.HOME),
          child: (_, args) => HomePage(),
        ),
      ];

  @override
  Widget get bootstrap => App();
}
