import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_recipe/models/user_model.dart';
import 'package:my_recipe/pages/user_view/widgets/form_buttons.dart';
import 'package:my_recipe/pages/user_view/widgets/profile_picture.dart';
import 'package:my_recipe/repositories/users_repo.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/user_fields.dart';

// hard coded ID of the user to be displayed
const _userId = 'O0QuKaTWBUYuoCO1w7Fe08VOMSj2';

// margin top ratio of the fields container with respect to the screen height
const _marginTopR = 0.47;
const _fieldsContainerHeightR = 0.48; // with respect to the screen height
// extra image height that goes below the fields container
const _extraImageHeight = 100;
// border radius of fields container
const _fieldsContainerBorderRadius = 30.0;
const _fieldsContainerPaddingV = pagePaddingHorizental - 8;

final _usersRepo = UsersRepository.instance;

class UserViewPage extends StatefulWidget {
  static const path = '/user_view';

  const UserViewPage({Key? key}) : super(key: key);

  @override
  State<UserViewPage> createState() => _UserViewPageState();
}

class _UserViewPageState extends State<UserViewPage> {
  final nameController = TextEditingController(),
      emailController = TextEditingController(),
      addressController = TextEditingController(),
      phoneNumberController = TextEditingController();
  String? gender;
  String uid = '';

  void _fetchUser() async {
    final user = await _usersRepo.getUser(uid);
    if (user == null) return;
    nameController.text = user.name;
    emailController.text = user.email;
    addressController.text = user.address;
    phoneNumberController.text = user.phone;
    setState(() => gender = user.gender);
  }

  NormalUser _buildUser() => NormalUser(
        name: nameController.text,
        email: emailController.text,
        address: addressController.text,
        gender: gender!,
        phone: phoneNumberController.text,
        id: uid,
      );

  void _onUpdatePressed() async {
    final user = _buildUser();

    try {
      await _usersRepo.updateUser(user);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User updated successfully.'),
        ),
      );
    } catch (e) {
      stderr.writeln(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update. Please try again.'),
        ),
      );
    }
  }

  void _onDeletePressed() async {
    try {
      await _usersRepo.deleteUser(uid);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account deleted successfully.'),
        ),
      );
      Navigator.of(context).pop();
    } catch (e) {
      stderr.writeln(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete account. Please try again.'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    uid = _userId;
    _fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final fieldsContainerTopMargin =
        MediaQuery.of(context).size.height * _marginTopR;
    final fieldsContainerHeight =
        MediaQuery.of(context).size.height * _fieldsContainerHeightR;
    final fieldsContainerWidth =
        MediaQuery.of(context).size.width - (_fieldsContainerPaddingV * 2);
    final imageHeight = fieldsContainerTopMargin + _extraImageHeight;
    final boxBelowImageHeight = MediaQuery.of(context).size.height -
        (fieldsContainerTopMargin + _extraImageHeight);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                ProfilePicture(
                  height: imageHeight,
                ),
                SizedBox(
                  height: boxBelowImageHeight,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: fieldsContainerTopMargin),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: _fieldsContainerPaddingV,
                  ),
                  child: Container(
                    height: fieldsContainerHeight,
                    width: fieldsContainerWidth,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3FA),
                      borderRadius: BorderRadius.circular(
                        _fieldsContainerBorderRadius,
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                              vertical: 40,
                              horizontal: 20,
                            ),
                            child: UserFields(
                              isEditing: true,
                              fullNameController: nameController,
                              emailController: emailController,
                              addressController: addressController,
                              phoneNumberController: phoneNumberController,
                              gender: gender,
                              onGenderChanged: (g) =>
                                  setState(() => gender = g),
                            ),
                          ),
                        ),
                        FormButtons(
                          buttonRadius: _fieldsContainerBorderRadius,
                          onUpdatePressed: _onUpdatePressed,
                          onDeletePressed: _onDeletePressed,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
