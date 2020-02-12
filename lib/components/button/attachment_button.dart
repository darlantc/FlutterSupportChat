import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat/utils/image_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AttachmentButton extends StatelessWidget {
  final Function(File) didSelectFile;
  const AttachmentButton({Key key, this.didSelectFile}) : super(key: key);

  PopupMenuItem attachmentMenuItem({
    dynamic value,
    String label,
    IconData icon,
  }) =>
      PopupMenuItem<int>(
        value: value,
        child: Row(children: [
          Icon(icon),
          Container(width: 16),
          Text(label),
        ]),
      );

  didSelect(BuildContext context, _selectedValue) async {
    var source = ImageSource.gallery;
    if (_selectedValue == 0) {
      source = ImageSource.camera;
    }
    var file = await pickImage(context: context, source: source);
    this.didSelectFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(FontAwesomeIcons.paperclip),
      onSelected: (_selectedValue) => didSelect(context, _selectedValue),
      itemBuilder: (BuildContext context) => [
        attachmentMenuItem(
          icon: FontAwesomeIcons.camera,
          label: "Câmera",
          value: 0,
        ),
        attachmentMenuItem(
          icon: FontAwesomeIcons.images,
          label: "Biblioteca de fotos",
          value: 1,
        ),
      ],
    );
  }
}
