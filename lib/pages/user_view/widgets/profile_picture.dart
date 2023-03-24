import 'dart:io';

import 'package:flutter/material.dart';

const _assetImage = "assets/user.png";

class ProfilePicture extends StatelessWidget {
  final double height;
  final String? image;

  const ProfilePicture({
    Key? key,
    required this.height,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image img;
    if (image == null) {
      img = Image.asset(_assetImage);
    } else if (image!.startsWith('http')) {
      img = Image.network(image!);
    } else {
      img = Image.file(File(image!));
    }

    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.transparent,
          ],
          stops: [0.8, 1],
        ).createShader(
          Rect.fromLTRB(
            0,
            0,
            rect.width,
            rect.height,
          ),
        );
      },
      blendMode: BlendMode.dstIn,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: img.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
