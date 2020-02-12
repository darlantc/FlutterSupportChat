import 'package:flutter_chat/model/author_model.dart';
import 'package:flutter_chat/model/chat_model.dart';
import 'package:flutter_chat/model/message_model.dart';
import 'package:mobx/mobx.dart';
part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  _ChatStoreBase() {
    reaction((_) => selectedChatId, this.getSelectedChatMessages);
  }

  @observable
  bool isAdminView = false;
  @observable
  bool isFetching = false;

  @observable
  String selectedChatId;

  @observable
  String message = "";

  @observable
  String selectedMessageId;

  @observable
  ObservableList<ChatModel> chatsList;
  @observable
  ObservableList<MessageModel> selectedChatMessagesList;

  @action
  setIsAdminView(bool newValue) => this.isAdminView = newValue;
  @action
  setIsFetching(bool newValue) => this.isFetching = newValue;
  @action
  setSelectedChatId(String newValue) => this.selectedChatId = newValue;

  @action
  onChangeMessage(String newValue) => this.message = newValue;

  @action
  setSelectedMessageId(String newValue) => this.selectedMessageId = newValue;

  @action
  cancelEditingMessage() => this.selectedMessageId = null;

  @action
  setChatsList(List<ChatModel> newValue) =>
      this.chatsList = newValue.asObservable();

  @action
  setSelectedChatMessagesList(List<MessageModel> newValue) =>
      this.selectedChatMessagesList = newValue.asObservable();

  @computed
  ChatModel get selectedChat {
    if (this.selectedChatId != null) {
      return chatsList.firstWhere(
        (chat) => chat.id == this.selectedChatId,
        orElse: () => null,
      );
    }
    return null;
  }

  @computed
  MessageModel get selectedMessageForEditing {
    if (this.selectedMessageId != null) {
      return this.selectedChatMessagesList.firstWhere(
            (message) => message.id == this.selectedMessageId,
            orElse: () => null,
          );
    }
    return null;
  }

  @computed
  int get totalUnreadMessagesCount {
    int count = 0;
    this.chatsList.forEach((chat) {
      if (this.isAdminView) {
        count += chat.user.unreadMessagesCount;
      } else {
        count += chat.user.unreadMessagesCount;
      }
    });

    return count;
  }

  clearStore() {
    this.setSelectedChatId(null);
    this.setChatsList(null);
    this.setSelectedChatMessagesList(null);
  }

  getChatsList() {
    List<ChatModel> list = List<ChatModel>();
    // TODO: implementar buscar chats do BD
    var user = AuthorModel(
        type: AuthorType.user,
        isConnected: false,
        isReading: false,
        isTyping: false,
        unreadMessagesCount: 0);
    var admin = AuthorModel(
        type: AuthorType.admin,
        isConnected: true,
        isReading: true,
        isTyping: false,
        unreadMessagesCount: 0);
    ChatModel chat = ChatModel(
      id: "chat1",
      subject: "Erro no relatório",
      user: user,
      admin: admin,
      createdAt: 1547001767972,
      hasUserMessage: true,
      isClosed: false,
      lastMessage: "Não estou conseguindo visualizar o relatório",
      lastMessageTimestamp: 1539284359878,
      lastMessageAuthor: AuthorType.user,
      messagesCount: 3,
      userId: "user1",
    );
    list.add(chat);

    this.setChatsList(list);
  }

  getSelectedChatMessages(String _selectedChatId) {
    if (_selectedChatId?.isNotEmpty ?? false) {
      // TODO: implementar recuperar mensagens do BD

      var list = List<MessageModel>();
      var message1 = MessageModel(
        id: "message1",
        type: MessageType.text,
        author: AuthorType.user,
        message: "Boa tarde. Preciso de ajuda",
        timestamp: 1539284359878,
        isRead: true,
      );
      var message2 = MessageModel(
        id: "message2",
        type: MessageType.text,
        author: AuthorType.admin,
        message: "Olá, boa tarde. Como posso ajudar?",
        adminName: "Suporte 1",
        timestamp: 1539284359878,
        isRead: true,
      );
      var message3 = MessageModel(
        id: "message3",
        type: MessageType.image,
        author: AuthorType.user,
        message: "Legenda imagem 1",
        timestamp: 1581361792407,
        isRead: true,
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/modboxdev.appspot.com/o/chats%2F-LzliIWPpWxuHqKPV5AN%2F-Lzljk0Zv6DNEwdVjvzx.jpeg?alt=media&token=b627e3eb-0f01-4cf4-ab1c-6e5ebd76de60",
        fileExtension: "jpeg",
      );
      var message4 = MessageModel(
        id: "message3",
        type: MessageType.image,
        author: AuthorType.admin,
        message: "Legenda da imagem 2",
        timestamp: 1581361792407,
        isRead: true,
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/modboxdev.appspot.com/o/chats%2F-LzmNcuHYXxLDHMf9fyd%2F-M-1-vYRguTFuDcrpeCG.jpeg?alt=media&token=0f07e734-0dcc-41f7-9881-f8c24448430d",
        fileExtension: "jpeg",
      );
      var message5 = MessageModel(
        id: "message3",
        type: MessageType.text,
        author: AuthorType.user,
        message: "Não estou conseguindo visualizar o relatório",
        timestamp: 1581361792407,
        isRead: true,
      );
      list.add(message1);
      list.add(message2);
      list.add(message3);
      list.add(message4);
      list.add(message5);
      this.setSelectedChatMessagesList(list);
    } else {
      this.setSelectedChatMessagesList(null);
    }
  }

  didSendMessage() {
    // TODO: implementar salvar nova mensagem
  }

  didDeleteChatMessage(String messageId) {
    // TODO: implementar deleção da mensagem
  }
}
