import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class OutlinedTextField extends StatelessWidget {
  final String? Function(String?)? validator;

  final String? hintText;
  final TextEditingController? controller;
  final bool compulsory;
  final bool obscureText;

  const OutlinedTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.compulsory = true,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (compulsory && value!.isEmpty) {
          return 'This field is required';
        }
        return validator?.call(value);
      },
      decoration: InputDecoration(
        label: hintText != null ? Text(hintText!) : null,
        border: const OutlineInputBorder(
          borderRadius: fieldBorderRadius,
        ),
      ),
    );
  }
}
