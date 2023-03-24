import 'package:flutter/material.dart';
import 'package:my_recipe/widgets/rounded_dropdown.dart';

class GenderField extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String? value;

  const GenderField({
    Key? key,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedDropdown<String>(
      value: value,
      items: const [
        DropdownMenuItem(
          value: null,
          child: Text('Gender'),
        ),
        DropdownMenuItem(
          value: 'male',
          child: Text('Male'),
        ),
        DropdownMenuItem(
          value: 'female',
          child: Text('Female'),
        ),
      ],
      onChanged: onChanged,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "Please select a value";
        }
        return null;
      },
    );
  }
}
