import 'package:flutter_chat/model/author_model.dart';

class ChatModel {
  AuthorModel admin;
  AuthorModel user;
  int createdAt;
  bool hasUserMessage;
  bool isClosed;
  String lastMessage;
  int lastMessageTimestamp;
  int messagesCount;
  String title;
  String subject;
  String userId;

  ChatModel({
    this.admin,
    this.user,
    this.createdAt,
    this.hasUserMessage,
    this.isClosed,
    this.lastMessage,
    this.lastMessageTimestamp,
    this.messagesCount,
    this.title,
    this.subject,
    this.userId,
  });
}
