import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool multiline;
  final int maxLength;
  final String Function(String) validator;
  final Function onSaved;

  const InputText({
    Key key,
    this.value,
    this.validator,
    this.onSaved,
    this.icon,
    this.label,
    this.multiline = false,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: TextFormField(
        maxLength: this.maxLength,
        maxLines: this.multiline ? null : 1,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: this.validator,
        initialValue: this.value,
        onSaved: this.onSaved,
      ),
    );
  }
}
