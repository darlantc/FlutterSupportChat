import 'package:flutter_chat/model/author_model.dart';

bool messageIsMine(bool isAdminView, AuthorType author) {
  return isAdminView ? author == AuthorType.admin : author == AuthorType.user;
}
