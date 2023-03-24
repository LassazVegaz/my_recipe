import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: formButtonWidth,
          child: OutlinedButton(
            onPressed: () {},
            child: const Text('Reset'),
          ),
        ),
        SizedBox(
          width: formButtonWidth,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Update'),
          ),
        ),
        SizedBox(
          width: formButtonWidth,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
