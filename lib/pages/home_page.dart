import 'package:flutter/material.dart';
import 'package:flutter_chat/components/button/button.dart';
import 'package:flutter_chat/components/loading/loading_view.dart';
import 'package:flutter_chat/services/notifications_service.dart';
import 'package:flutter_chat/stores/auth_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthStore authStore = Modular.get<AuthStore>();
    NotificationsService notificationsService =
        Modular.get<NotificationsService>();

    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chat"),
      ),
      body: Observer(
        builder: (_) {
          if (!authStore.didVerifyIsLoggedIn) {
            return LoadingView();
          }

          return Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bem vindo!"),
                  Container(
                    height: 20,
                  ),
                  Button(
                    color: Colors.lightBlue,
                    icon: Icons.notifications,
                    label: "Notificar informação",
                    onPressed: () => notificationsService
                        .notifyInfo("Mensagem de informação"),
                  ),
                  Button(
                    color: Colors.green,
                    icon: Icons.notifications,
                    label: "Notificar sucesso",
                    onPressed: () => notificationsService
                        .notifySuccess("Mensagem de sucesso!"),
                  ),
                  Button(
                    color: Colors.orange,
                    icon: Icons.notifications,
                    label: "Notificar alerta",
                    onPressed: () => notificationsService
                        .notifyWarning("Mensagem de alerta"),
                  ),
                  Button(
                    color: Colors.red,
                    icon: Icons.notifications,
                    label: "Notificar erro",
                    onPressed: () =>
                        notificationsService.notifyDanger("Mensagem de erro!"),
                  ),
                  Container(height: 80),
                  Button(
                    color: Colors.white,
                    labelColor: theme.primaryColor,
                    icon: Icons.exit_to_app,
                    label: "Sair",
                    onPressed: authStore.logout,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
