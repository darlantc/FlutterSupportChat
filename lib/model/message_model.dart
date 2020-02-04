import 'package:flutter/material.dart';
import 'package:flutter_chat/model/author_model.dart';

enum MessageType {
  text,
  image,
}

class MessageModel {
  AuthorModel author;
  bool isRead;
  String message;
  int timestamp;
  MessageType type;

  MessageModel({
    @required this.author,
    @required this.isRead,
    @required this.message,
    @required this.timestamp,
    @required this.type,
  });
}
