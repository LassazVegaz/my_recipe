import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

class Buttons extends StatelessWidget {
  final VoidCallback? onSignUp;

  const Buttons({
    Key? key,
    this.onSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: formButtonWidth,
          child: ElevatedButton(
            onPressed: onSignUp,
            child: const Text('Sign Up'),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ],
    );
  }
}
