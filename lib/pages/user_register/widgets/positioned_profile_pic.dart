import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class PositionedProfilePic extends StatelessWidget {
  final double top;
  final double radius;

  const PositionedProfilePic({
    Key? key,
    required this.top,
    required this.radius,
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
        child: CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage('assets/user.png'),
        ),
      ),
    );
  }
}
