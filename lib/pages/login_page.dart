import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_fields.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

class LoginPage extends StatelessWidget {
  static const path = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: pagePaddingHorizental,
        ),
        child: Column(
          children: [
            const SizedBox(height: 120),
            const OutlinedTextField(
              hintText: 'Email',
            ),
            const SizedBox(height: 24),
            const OutlinedTextField(
              hintText: 'Password',
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: formButtonWidth,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Don\'t have an account?'),
                SizedBox(width: 8),
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
