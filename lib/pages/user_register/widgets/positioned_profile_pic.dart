import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/image_selector.dart';

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
        child: ImageSelector(
          defaultAssetImage: "assets/user.png",
          image: file,
          onImageSelected: (path) => setState(() => file = path),
          builder: (image) => ClipOval(
            child: CircleAvatar(
              radius: widget.radius,
              backgroundColor: Colors.white,
              backgroundImage: image,
            ),
          ),
        ),
      ),
    );
  }
}
