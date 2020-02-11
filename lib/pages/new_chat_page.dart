import 'package:flutter/material.dart';

class NewChatPage extends StatelessWidget {
  Widget renderBody() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova conversa"),
        centerTitle: true,
      ),
      body: renderBody(),
    );
  }
}
