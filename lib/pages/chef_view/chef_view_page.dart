import 'package:flutter/material.dart';
import 'package:my_recipe/models/chef_model.dart';
import 'package:my_recipe/pages/chef_view/widgets/buttons.dart';
import 'package:my_recipe/repositories/chefs_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/chef_fields.dart';

final _chefsRepo = ChefsRepository.instance;

class ChefViewPage extends StatefulWidget {
  static const path = '/chef_view';

  const ChefViewPage({Key? key}) : super(key: key);

  @override
  State<ChefViewPage> createState() => _ChefViewPageState();
}

class _ChefViewPageState extends State<ChefViewPage> {
  String? _uid;
  final _firstNameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _emailController = TextEditingController(),
      _phoneNumberController = TextEditingController();
  String? gender;

  void _loadChef() async {
    final chef = await _chefsRepo.getChef(_uid!);
    _firstNameController.text = chef!.firstName;
    _lastNameController.text = chef.lastName;
    _emailController.text = chef.email;
    _phoneNumberController.text = chef.phone;
    setState(() => gender = chef.gender);
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: pagePaddingHorizental,
          ),
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
              ),
              const SizedBox(height: 40),
              const Buttons(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
