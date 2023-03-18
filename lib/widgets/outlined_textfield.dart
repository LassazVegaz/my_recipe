import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class OutlinedTextField extends StatelessWidget {
  final String? hintText;

  const OutlinedTextField({
    Key? key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: fieldBorderRadius,
        ),
      ),
    );
  }
}
