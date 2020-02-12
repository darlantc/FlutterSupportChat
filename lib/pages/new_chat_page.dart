import 'package:flutter/material.dart';
import 'package:flutter_chat/components/button/button.dart';
import 'package:flutter_chat/components/form/input_text.dart';
import 'package:flutter_chat/stores/chat_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NewChatPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void submit(BuildContext context, ChatStore chatStore) async {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      FocusScope.of(context).requestFocus(new FocusNode());

      chatStore.createNewChat();
    }
  }

  Widget _renderFormButton(BuildContext context, ChatStore chatStore) {
    return FormButton(
      isEditing: false,
      onPressed: () => this.submit(context, chatStore),
      label: "Iniciar nova conversa",
    );
  }

  List<Widget> _renderFormFields(ChatStore chatStore) {
    return [
      InputText(
        label: "Assunto",
        icon: FontAwesomeIcons.envelopeOpenText,
        value: "",
        maxLength: 40,
        onSaved: chatStore.onChangeNewChatSubject,
      ),
      Divider(),
      InputText(
        label: "Como podemos ajuda-lo?",
        icon: FontAwesomeIcons.textHeight,
        value: "",
        onSaved: chatStore.onChangeMessage,
        maxLength: 240,
        multiline: true,
      ),
      Divider(),
    ];
  }

  Widget renderForm(BuildContext context, ChatStore chatStore) {
    return Form(
      key: this._formKey,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 30.0,
        ),
        child: Column(children: [
          Expanded(
            child: ListView(
              children: _renderFormFields(chatStore),
            ),
          ),
          _renderFormButton(context, chatStore),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var chatStore = Modular.get<ChatStore>();

    return ModalProgressHUD(
      opacity: 0.8,
      inAsyncCall: chatStore.isWaitingForm,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nova conversa"),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.solidSave),
              onPressed: () => this.submit(context, chatStore),
            ),
          ],
        ),
        body: SafeArea(
          child: this.renderForm(
            context,
            chatStore,
          ),
        ),
      ),
    );
  }
}
