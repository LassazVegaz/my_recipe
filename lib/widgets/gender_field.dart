import 'package:flutter/material.dart';
import 'package:my_recipe/widgets/rounded_dropdown.dart';

class GenderField extends StatelessWidget {
  const GenderField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedDropdown<String>(
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
      onChanged: (value) {},
    );
  }
}
