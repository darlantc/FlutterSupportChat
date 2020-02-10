import 'package:flutter/foundation.dart';

class UserModel {
  String name;
  String email;
  String token;
  bool isAdmin;

  UserModel({
    @required this.name,
    @required this.email,
    @required this.token,
    @required this.isAdmin,
  });
}
