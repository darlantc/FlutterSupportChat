import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final int value;
  const Badge({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var moreThan99 = this.value > 99;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.green,
        height: 30,
        width: 30,
        child: Center(
          child: Text(
            moreThan99 ? "99+" : "$value",
            style: TextStyle(fontSize: moreThan99 ? 12 : 16),
          ),
        ),
      ),
    );
  }
}
