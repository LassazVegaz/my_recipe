import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';
import 'package:my_recipe/widgets/rounded_dropdown.dart';
import 'package:my_recipe/widgets/rounded_multiselect.dart';

class ChefFields extends StatelessWidget {
  const ChefFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage('assets/chef.jpg'),
        ),
        const SizedBox(height: 50),
        Row(
          children: const [
            Expanded(
              child: OutlinedTextField(
                hintText: 'First name',
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              child: OutlinedTextField(
                hintText: 'Last name',
              ),
            ),
          ],
        ),
        const SizedBox(height: fieldVerticalGap),
        const OutlinedTextField(
          hintText: 'Email',
        ),
        const SizedBox(height: fieldVerticalGap),
        const OutlinedTextField(
          hintText: 'Password',
        ),
        const SizedBox(height: fieldVerticalGap),
        const OutlinedTextField(
          hintText: 'Confirm password',
        ),
        const SizedBox(height: fieldVerticalGap),
        const OutlinedTextField(
          hintText: 'Phone number',
        ),
        const SizedBox(height: fieldVerticalGap),
        RoundedDropdown<String>(
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
        ),
        const SizedBox(height: fieldVerticalGap),
        RoundedMultiSelect(
          items: [
            MultiSelectItem('Italian', 'Italian'),
            MultiSelectItem('Chinese', 'Chinese'),
          ],
          title: 'Select your cuisine',
          buttonText: 'Food types',
          onConfirm: (p0) {},
        ),
      ],
    );
  }
}
