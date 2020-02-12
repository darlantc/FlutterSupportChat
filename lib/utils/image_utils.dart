import "dart:async";
import "dart:io";
import "package:flutter/material.dart";
import "package:image_cropper/image_cropper.dart";
import "package:image_picker/image_picker.dart";

Future<File> pickImage({
  BuildContext context,
  ImageSource source,
  int imageQuality,
}) async {
  var imageFile = await ImagePicker.pickImage(
    source: source ?? ImageSource.gallery,
    imageQuality: imageQuality ?? 80,
  );

  return await cropImage(context: context, imageFile: imageFile);
}

Future<File> cropImage({
  BuildContext context,
  File imageFile,
}) async {
  var theme = Theme.of(context);
  return await ImageCropper.cropImage(
    sourcePath: imageFile.path,
    aspectRatioPresets: Platform.isAndroid
        ? [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ]
        : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
    androidUiSettings: AndroidUiSettings(
      toolbarTitle: "Escolha a imagem",
      toolbarColor: theme.primaryColor,
      toolbarWidgetColor: theme.accentColor,
      initAspectRatio: CropAspectRatioPreset.original,
      lockAspectRatio: false,
    ),
    iosUiSettings: IOSUiSettings(
        title: "Escolha a imagem",
        doneButtonTitle: "Pronto",
        cancelButtonTitle: "Cancelar"),
  );
}
