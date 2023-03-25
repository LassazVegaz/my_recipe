import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/image_selector.dart';

class PositionedProfilePic extends StatelessWidget {
  final void Function(String)? onImageSelected;

  final double top;
  final double radius;
  final String? image;

  const PositionedProfilePic({
    Key? key,
    required this.top,
    required this.radius,
    this.onImageSelected,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: MediaQuery.of(context).size.width / 2 - radius,
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
          image: image,
          onImageSelected: onImageSelected,
          builder: (image) => ClipOval(
            child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.white,
              backgroundImage: image,
            ),
          ),
        ),
      ),
    );
  }
}
