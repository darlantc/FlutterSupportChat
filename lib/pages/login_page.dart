import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_chat/components/button/button.dart';

import 'package:flutter_chat/components/loading/loading_view.dart';
import 'package:flutter_chat/stores/auth_store.dart';
import 'package:flutter_chat/utils/validate_field_util.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit(AuthStore authStore) async {
    // First validate form.
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      await authStore.submitLogin();
    }
  }

  Widget renderButton(AuthStore authStore) {
    final Size screenSize = MediaQuery.of(context).size;

    return ListTile(
        title: Container(
      width: screenSize.width,
      margin: EdgeInsets.only(top: 20.0),
      child: PrimaryButton(
        icon: Icons.person,
        label: "ENTRAR",
        onPressed: () => this.submit(authStore),
      ),
    ));
  }

  Widget _renderErrorMessage(AuthStore authStore) {
    if (authStore.errorMessage.isEmpty) {
      return Container();
    }

    return ListTile(
      title: Container(
        margin: EdgeInsets.only(top: 25.0, left: 5.0, right: 5.0),
        child: Text(
          authStore.errorMessage,
          style: TextStyle(
            color: Colors.red,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget renderBody(AuthStore authStore) {
    return Observer(
      builder: (_) {
        if (authStore.isFetching) {
          return LoadingView();
        }
        return Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: Form(
            key: this._formKey,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    // Use email input type for emails.
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Informe seu e-mail',
                    ),
                    initialValue: authStore.email,
                    validator: ValidateFieldUtil.validateEmail,
                    onSaved: authStore.setEmail,
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    obscureText: true, // Use secure text for passwords.
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Informe sua senha',
                    ),
                    validator: ValidateFieldUtil.validatePassword,
                    onSaved: authStore.setPassword,
                  ),
                ),
                this._renderErrorMessage(authStore),
                this.renderButton(authStore),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = Modular.get<AuthStore>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Observer(
          builder: (_) => Text(
            authStore.isFetching ? "Aguarde..." : "Entre com seu login",
          ),
        ),
      ),
      body: renderBody(authStore),
    );
  }
}
