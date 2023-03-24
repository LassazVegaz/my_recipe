import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/enums/role_enum.dart';
import 'package:my_recipe/pages/chef_register_page.dart';
import 'package:my_recipe/pages/chef_view/chef_view_page.dart';
import 'package:my_recipe/pages/user_home_page.dart';
import 'package:my_recipe/pages/user_register/user_register_page.dart';
import 'package:my_recipe/repositories/auth_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/outlined_textfield.dart';

final _authRepo = AuthRrepository.instance;

// ratios of gaps respect to the screen height
const _gap1R = 0.07; // start and email field
const _gap2R = 0.13; // password field and login button

class LoginPage extends StatefulWidget {
  static const path = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  void _onLoginPressed() async {
    if (!_formKey.currentState!.validate()) return;
    var email = _emailController.text;
    var password = _passwordController.text;

    try {
      var user = await _authRepo.signIn(email, password);

      if (!mounted) return;

      var nextPage =
          _authRepo.role == Role.chef ? ChefViewPage.path : UserHomePage.path;

      Navigator.of(context)
          .pushReplacementNamed(nextPage, arguments: user!.uid);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong. Please try again."),
        ),
      );
    }
  }

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    OutlinedTextField(
                      hintText: 'Email',
                      controller: _emailController,
                    ),
                    const SizedBox(height: fieldVerticalGap),
                    OutlinedTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: _gap2R * MediaQuery.of(context).size.height,
                    ),
                    SizedBox(
                      width: formButtonWidth,
                      child: ElevatedButton(
                        onPressed: _onLoginPressed,
                        child: const Text('Login'),
                      ),
                    ),
                  ],
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
