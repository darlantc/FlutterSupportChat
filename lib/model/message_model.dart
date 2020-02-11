import 'package:flutter/material.dart';
import 'package:flutter_chat/model/author_model.dart';
import 'package:flutter_chat/utils/date_utils.dart';

enum MessageType {
  text,
  image,
}

class MessageModel {
  String id;
  AuthorType author;
  bool isRead;
  String message;
  int timestamp;
  MessageType type;
  String adminName;

  MessageModel({
    @required this.id,
    @required this.author,
    @required this.isRead,
    @required this.message,
    @required this.timestamp,
    @required this.type,
    this.adminName,
  });

  String get formattedData {
    return formattedDayAndHourFromFirebaseTimestamp(this.timestamp);
  }
}
