import 'package:flutter_chat/model/author_model.dart';

class ChatModel {
  String id;
  AuthorModel admin;
  AuthorModel user;
  int createdAt;
  bool hasUserMessage;
  bool isClosed;
  String lastMessage;
  int lastMessageTimestamp;
  AuthorType lastMessageAuthor;
  int messagesCount;
  String subject;
  String userId;

  ChatModel({
    this.id,
    this.admin,
    this.user,
    this.createdAt,
    this.hasUserMessage,
    this.isClosed,
    this.lastMessage,
    this.lastMessageTimestamp,
    this.lastMessageAuthor,
    this.messagesCount,
    this.subject,
    this.userId,
  });
}
