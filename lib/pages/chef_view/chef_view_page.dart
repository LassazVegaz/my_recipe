import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_recipe/enums/role_enum.dart';
import 'package:my_recipe/models/chef_model.dart';
import 'package:my_recipe/pages/chef_view/widgets/buttons.dart';
import 'package:my_recipe/pages/login_page.dart';
import 'package:my_recipe/repositories/auth_repo.dart';
import 'package:my_recipe/repositories/chefs_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_fields.dart';

final _chefsRepo = ChefsRepository.instance;
final _authRepo = AuthRrepository.instance;

class ChefViewPage extends StatefulWidget {
  static const path = '/chef_view';

  const ChefViewPage({Key? key}) : super(key: key);

  @override
  State<ChefViewPage> createState() => _ChefViewPageState();
}

class _ChefViewPageState extends State<ChefViewPage> {
  final _formKey = GlobalKey<FormState>();
  String? _uid;
  String? gender;
  String? image;
  List<String> foodTypes = [];
  final _firstNameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _emailController = TextEditingController(),
      _phoneNumberController = TextEditingController();

  void _loadChef() async {
    final chef = await _chefsRepo.getChef(_uid!);
    _firstNameController.text = chef!.firstName;
    _lastNameController.text = chef.lastName;
    _emailController.text = chef.email;
    _phoneNumberController.text = chef.phone;
    setState(() {
      gender = chef.gender;
      image = chef.image;
      foodTypes = chef.foodTypes;
    });
  }

  Chef _buildChef() => Chef(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneNumberController.text,
        gender: gender!,
        foodTypes: foodTypes,
        id: _uid,
        image: image,
      );

  void _onUppdatePressed() async {
    if (!_formKey.currentState!.validate()) return;

    final chef = _buildChef();

    try {
      await _chefsRepo.updateChef(chef);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account updated successfully.'),
        ),
      );
      setState(() {});
    } catch (e) {
      stderr.writeln(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update account. Please try again.'),
        ),
      );
    }
  }

  void _onDeletePressed() async {
    try {
      await _chefsRepo.deleteChef(_uid!);

      if (_authRepo.role == Role.chef) {
        await _authRepo.signOut();
      }

      if (!mounted) return;

      if (_authRepo.role == Role.chef) {
        Navigator.of(context).pushReplacementNamed(LoginPage.path);
      } else {
        Navigator.of(context).pop();
      }
    } catch (e) {
      stderr.writeln(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete account. Please try again.'),
        ),
      );
    }
  }

  void _onResetPressed() {
    _formKey.currentState!.reset();
    _loadChef();
  }

  void _onSignOutPressed() async {
    try {
      await _authRepo.signOut();

      if (!mounted) return;

      Navigator.of(context).pushReplacementNamed(LoginPage.path);
    } catch (e) {
      stderr.writeln(e);
      Navigator.of(context).pushReplacementNamed(LoginPage.path);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _uid = ModalRoute.of(context)!.settings.arguments as String;
      _loadChef();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_firstNameController.text} ${_lastNameController.text}',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        actions: _authRepo.role == Role.chef
            ? [
                IconButton(
                  icon: const Icon(Icons.power_settings_new),
                  onPressed: _onSignOutPressed,
                ),
              ]
            : [],
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
                  isEditing: true,
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailController: _emailController,
                  phoneNumberController: _phoneNumberController,
                  gender: gender,
                  onGenderChanged: (g) => setState(() => gender = g),
                  image: image,
                  onImageSelected: (i) => setState(() => image = i),
                  foodTypes: foodTypes,
                  onFoodTypesSelected: (f) => setState(() => foodTypes = f),
                ),
                const SizedBox(height: 40),
                _authRepo.role != Role.user
                    ? Buttons(
                        onUpdatePressed: _onUppdatePressed,
                        onDeletePressed: _onDeletePressed,
                        onResetPressed: _onResetPressed,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
