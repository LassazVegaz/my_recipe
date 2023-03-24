import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_recipe/theme.dart';

class PositionedProfilePic extends StatefulWidget {
  final double top;
  final double radius;

  const PositionedProfilePic({
    Key? key,
    required this.top,
    required this.radius,
  }) : super(key: key);

  @override
  State<PositionedProfilePic> createState() => _PositionedProfilePicState();
}

class _PositionedProfilePicState extends State<PositionedProfilePic> {
  String? file;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: MediaQuery.of(context).size.width / 2 - widget.radius,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primaryColor,
              blurRadius: 15,
              offset: Offset(0, 0),
              spreadRadius: 2,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () async {
            final pickedFile = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );
            if (pickedFile != null) {
              setState(() {
                file = pickedFile.path;
              });
            }
          },
          child: CircleAvatar(
            radius: widget.radius,
            backgroundColor: Colors.white,
            backgroundImage: file != null
                ? Image.file(File(file!)).image
                : Image.asset("assets/user.png").image,
          ),
        ),
      ),
    );
  }
}
