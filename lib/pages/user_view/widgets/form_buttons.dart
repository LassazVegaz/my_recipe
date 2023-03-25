import 'package:flutter/material.dart';

const _buttonPadding = EdgeInsets.symmetric(
  vertical: 15,
);

class FormButtons extends StatelessWidget {
  final VoidCallback? onUpdatePressed;
  final VoidCallback? onDeletePressed;

  final double buttonRadius;

  const FormButtons({
    Key? key,
    required this.buttonRadius,
    this.onUpdatePressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onUpdatePressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(buttonRadius),
                ),
              ),
              padding: _buttonPadding,
            ),
            child: const Text('Update'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: onDeletePressed,
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(buttonRadius),
                ),
              ),
              padding: _buttonPadding,
            ),
            child: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
