import 'package:flutter/material.dart';
import 'package:flutter_chat/components/badge/badge.dart';
import 'package:flutter_chat/routes/app_routes.dart';
import 'package:flutter_chat/stores/chat_store.dart';
import 'package:flutter_chat/utils/date_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "package:flutter_chat/utils/utils.dart";
import "package:flutter_chat/extensions/text_extension.dart";

class ChatsListPage extends StatelessWidget {
  Widget renderBody() {
    final ChatStore chatStore = Modular.get<ChatStore>();
    var isAdminView = chatStore.isAdminView;
    return Observer(builder: (_) {
      var chatsList = chatStore.chatsList;
      return ListView.builder(
        itemCount: chatsList.length,
        itemBuilder: (BuildContext context, int index) {
          var chat = chatsList[index];

          var lastMessageIsMine =
              messageIsMine(isAdminView, chat.lastMessageAuthor);

          return Card(
            child: ListTile(
              onTap: () => chatStore.setSelectedChatId(chat.id),
              title: Text(
                chat.subject,
              ).h2(),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    chat.lastMessage,
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(height: 8),
                  Text(
                    formattedDayAndHourFromFirebaseTimestamp(
                        chat.lastMessageTimestamp),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Badge(value: chat.messagesCount)],
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suas conversas"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(children: <Widget>[
            Expanded(
              child: renderBody(),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () => Modular.to.pushNamed(pathForRoute(APP_ROUTE.NEW_CHAT)),
      ),
    );
  }
}
