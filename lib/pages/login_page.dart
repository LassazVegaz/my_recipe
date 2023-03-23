import 'package:flutter/material.dart';
import 'package:my_recipe/pages/chef_register_page.dart';
import 'package:my_recipe/pages/user_register/user_register_page.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

// ratios of gaps respect to the screen height
const _gap1R = 0.07; // start and email field
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
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 180,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ChefRegisterPage.path);
                  },
                  child: const Text('Register as a Chef'),
                ),
              ),
              SizedBox(
                width: 180,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, UserRegisterPage.path);
                  },
                  child: const Text('Register as a Foodaholic'),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
