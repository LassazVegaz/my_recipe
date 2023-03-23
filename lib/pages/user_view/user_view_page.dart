import 'package:flutter/material.dart';
import 'package:my_recipe/pages/user_view/widgets/form_buttons.dart';
import 'package:my_recipe/pages/user_view/widgets/profile_picture.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/user_fields.dart';

// margin top ratio of the fields container with respect to the screen height
const _marginTopR = 0.47;
const _fieldsContainerHeightR = 0.48; // with respect to the screen height
// extra image height that goes below the fields container
const _extraImageHeight = 100;
// border radius of fields container
const _fieldsContainerBorderRadius = 30.0;
const _fieldsContainerPaddingV = pagePaddingHorizental - 8;

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

  @override
  Widget build(BuildContext context) {
    final fieldsContainerTopMargin =
        MediaQuery.of(context).size.height * _marginTopR;
    final fieldsContainerHeight =
        MediaQuery.of(context).size.height * _fieldsContainerHeightR;
    final fieldsContainerWidth =
        MediaQuery.of(context).size.width - (_fieldsContainerPaddingV * 2);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ProfilePicture(
                height: fieldsContainerTopMargin + _extraImageHeight,
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Positioned(
            top: fieldsContainerTopMargin,
            child: Padding(
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
                          onGenderChanged: (g) => setState(() => gender = g),
                        ),
                      ),
                    ),
                    const FormButtons(
                      buttonRadius: _fieldsContainerBorderRadius,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
