import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class Buttons extends StatelessWidget {
  final VoidCallback? onResetPressed;
  final VoidCallback? onUpdatePressed;
  final VoidCallback? onDeletePressed;

  const Buttons({
    Key? key,
    this.onResetPressed,
    this.onUpdatePressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: formButtonWidth,
          child: OutlinedButton(
            onPressed: onResetPressed,
            child: const Text('Reset'),
          ),
        ),
        SizedBox(
          width: formButtonWidth,
          child: ElevatedButton(
            onPressed: onUpdatePressed,
            child: const Text('Update'),
          ),
        ),
        SizedBox(
          width: formButtonWidth,
          child: ElevatedButton(
            onPressed: onDeletePressed,
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
