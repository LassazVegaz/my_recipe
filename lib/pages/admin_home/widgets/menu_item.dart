import 'package:flutter/material.dart';

class AdminMenuItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onPressed;

  const AdminMenuItem({
    Key? key,
    required this.title,
    required this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 140,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
