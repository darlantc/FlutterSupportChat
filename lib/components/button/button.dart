import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Color labelColor;
  final Function onPressed;

  const Button({
    Key key,
    this.onPressed,
    this.label,
    this.icon,
    this.color,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.label.toUpperCase(),
            style: TextStyle(
              color: this.labelColor,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            this.icon,
            color: labelColor,
            size: 20,
          ),
        ],
      ),
      onPressed: this.onPressed,
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;

  const PrimaryButton({
    Key key,
    this.onPressed,
    this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      label: this.label,
      icon: this.icon,
      color: Colors.blue,
      labelColor: Colors.white,
      onPressed: this.onPressed,
    );
  }
}

class FormButton extends StatelessWidget {
  final bool isEditing;
  final Function onPressed;
  const FormButton({Key key, this.isEditing, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: this.isEditing ? "ATUALIZAR" : "SALVAR",
      icon: FontAwesomeIcons.solidSave,
      onPressed: this.onPressed,
    );
  }
}
