import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

// ratios of gaps respect to the screen height
const _gap1R = 0.18; // start and email field
const _gap2R = 0.13; // password field and login button

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: pagePaddingHorizental,
          ),
          child: Column(
            children: [
              SizedBox(height: _gap1R * MediaQuery.of(context).size.height),
              const OutlinedTextField(
                hintText: 'Email',
              ),
              const SizedBox(height: fieldVerticalGap),
              const OutlinedTextField(
                hintText: 'Password',
              ),
              SizedBox(height: _gap2R * MediaQuery.of(context).size.height),
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
            ],
          ),
        ),
      ),
    );
  }
}
