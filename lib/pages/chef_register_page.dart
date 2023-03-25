import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe/models/chef_model.dart';
import 'package:my_recipe/pages/chef_view/chef_view_page.dart';
import 'package:my_recipe/repositories/chefs_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_fields.dart';

final _chefsRepo = ChefsRepository.instance;

class ChefRegisterPage extends StatefulWidget {
  const ChefRegisterPage({Key? key}) : super(key: key);

  static const path = '/chef_register';

  @override
  State<ChefRegisterPage> createState() => _ChefRegisterPageState();
}

class _ChefRegisterPageState extends State<ChefRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController(),
      _phoneNumberController = TextEditingController();
  String? gender;
  String? image;
  List<String> foodTypes = [];

  Chef _buildChef() => Chef(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneNumberController.text,
        gender: gender!,
        foodTypes: foodTypes,
        image: image,
      );

  void _onRegisterClick(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    var chef = _buildChef();

    try {
      var newChef = await _chefsRepo.createChef(chef, _passwordController.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully'),
          ),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          ChefViewPage.path,
          (route) => false,
          arguments: newChef.id,
        );
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    } catch (e) {
      debugPrint("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register as a Chef',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: pagePaddingHorizental,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                ChefFields(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  phoneNumberController: _phoneNumberController,
                  gender: gender,
                  onGenderChanged: (g) => setState(() => gender = g),
                  image: image,
                  onImageSelected: (i) => setState(() => image = i),
                  foodTypes: foodTypes,
                  onFoodTypesSelected: (f) => setState(() => foodTypes = f),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => _onRegisterClick(context),
                  child: const Text('Register'),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
