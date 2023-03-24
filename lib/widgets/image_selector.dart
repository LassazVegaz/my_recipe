import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector extends StatelessWidget {
  final Widget Function(ImageProvider<Object> image) builder;
  final void Function(String path)? onImageSelected;

  final String defaultAssetImage;
  final String? image;

  const ImageSelector({
    Key? key,
    required this.builder,
    required this.defaultAssetImage,
    this.image,
    this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image img;
    if (image == null) {
      img = Image.asset(defaultAssetImage);
    } else if (image!.startsWith('http')) {
      img = Image.network(image!);
    } else {
      img = Image.file(File(image!));
    }

    return GestureDetector(
      onTap: () async {
        final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (pickedFile != null) {
          onImageSelected?.call(pickedFile.path);
        }
      },
      child: builder(img.image),
    );
  }
}
