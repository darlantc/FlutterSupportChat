enum AuthorType {
  admin,
  user,
}

class AuthorModel {
  AuthorType type;
  bool isConnected;
  bool isReading;
  bool isTyping;
  int unreadMessagesCount;

  AuthorModel({
    this.type,
    this.isConnected,
    this.isReading,
    this.isTyping,
    this.unreadMessagesCount,
  });
}
