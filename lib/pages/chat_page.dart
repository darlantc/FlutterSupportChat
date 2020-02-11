import 'package:flutter/material.dart';
import 'package:flutter_chat/model/message_model.dart';
import 'package:flutter_chat/services/notifications_service.dart';
import 'package:flutter_chat/stores/chat_store.dart';
import 'package:flutter_chat/utils/utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MenuOption { delete, update }

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final SlidableController slidableController = SlidableController();

  Offset _tapPosition;

  _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  _didWantToDelete(String messageId) {
    //final ChatStore chatStore = Modular.get<ChatStore>();
  }

  _didWantToEdit(String messageId) {
    final ChatStore chatStore = Modular.get<ChatStore>();
    chatStore.setSelectedMessageId(messageId);
  }

  Widget renderMessageAdminName(
    String adminName,
    bool isAdminView,
  ) {
    NotificationsService notificationsService =
        Modular.get<NotificationsService>();
    if (isAdminView && adminName != null && adminName.isNotEmpty) {
      return IconButton(
        icon: Icon(
          FontAwesomeIcons.user,
          size: 12,
        ),
        onPressed: () =>
            notificationsService.notifyInfo("Escrito por: $adminName"),
      );
    }
    return Container();
  }

  didSelectMessage(String messageId) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();

    var selectedValue = await showMenu(
      context: context,
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: MenuOption.update,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Editar"),
              Icon(FontAwesomeIcons.pen),
            ],
          ),
        ),
        PopupMenuItem(
          value: MenuOption.delete,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Apagar",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              Icon(
                FontAwesomeIcons.trashAlt,
                color: Colors.red,
              ),
            ],
          ),
        )
      ],
      position: RelativeRect.fromRect(
        _tapPosition & Size(40, 40), // smaller rect, the touch area
        Offset.zero & overlay.size, // Bigger rect, the entire screen
      ),
    );
    if (selectedValue == MenuOption.update) {
      _didWantToEdit(messageId);
    } else if (selectedValue == MenuOption.delete) {
      _didWantToDelete(messageId);
    }
  }

  Widget renderMessagesList(BuildContext context, ChatStore chatStore) {
    return Observer(
      builder: (_) {
        var isAdminView = chatStore.isAdminView;
        var messagesList = chatStore.selectedChatMessagesList;
        return Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: messagesList == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Nenhuma mensagem nesta conversa."),
                        Container(height: 20),
                        Icon(FontAwesomeIcons.solidComments)
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: messagesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var message = messagesList[index];
                      var isMineMessage =
                          messageIsMine(isAdminView, message.author);
                      debugPrint("isMineMessage $isMineMessage");

                      var textAlign =
                          isMineMessage ? TextAlign.right : TextAlign.left;
                      return GestureDetector(
                        onLongPress: () => didSelectMessage(message.id),
                        onTapDown: _storePosition,
                        child: renderSlidable(
                          message,
                          textAlign,
                          isMineMessage,
                          isAdminView,
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }

  Widget _slidableAction({IconData icon, Color color, Function onTap}) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: IconSlideAction(
            icon: icon,
            color: color,
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  Widget renderSlidable(
    MessageModel message,
    TextAlign textAlign,
    bool isMineMessage,
    bool isAdminView,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      child: Slidable(
        controller: slidableController,
        child: Card(
            color: isMineMessage ? Colors.green.shade600 : null,
            child: this.renderMessageTile(
              message,
              textAlign,
              isMineMessage,
              isAdminView,
            )),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: <Widget>[
          _slidableAction(
            icon: FontAwesomeIcons.pen,
            color: Colors.blue,
            onTap: () => _didWantToEdit(message.id),
          ),
          _slidableAction(
            icon: FontAwesomeIcons.trashAlt,
            color: Colors.red,
            onTap: () => _didWantToDelete(message.id),
          ),
        ],
      ),
    );
  }

  ListTile renderMessageTile(
    MessageModel message,
    TextAlign textAlign,
    bool isMineMessage,
    bool isAdminView,
  ) {
    return ListTile(
      title: Text(
        message.message,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment:
            isMineMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          this.renderMessageAdminName(
            message.adminName,
            isAdminView,
          ),
          Text(
            message.formattedData,
            textAlign: textAlign,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderChatActions(ChatStore chatStore) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.paperclip),
          onPressed: chatStore.didSendMessage,
        ),
        Expanded(
          child: Container(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Mensagem...',
              ),
              onSaved: chatStore.onChangeMessage,
            ),
          ),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.solidPaperPlane),
          onPressed: chatStore.didSendMessage,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ChatStore chatStore = Modular.get<ChatStore>();

    return WillPopScope(
      onWillPop: () {
        chatStore.setSelectedChatId(null);
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              return Text(chatStore.selectedChat?.subject ?? "");
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              renderMessagesList(context, chatStore),
              renderChatActions(chatStore),
            ],
          ),
        ),
      ),
    );
  }
}
