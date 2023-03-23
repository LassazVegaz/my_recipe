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

class UserViewPage extends StatelessWidget {
  static const path = '/user_view';

  const UserViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldsContainerTopMargin =
        MediaQuery.of(context).size.height * _marginTopR;
    final fieldsContainerHeight =
        MediaQuery.of(context).size.height * _fieldsContainerHeightR;
    final fieldsContainerWidth =
        MediaQuery.of(context).size.width - (pagePaddingHorizental * 2);

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
                horizontal: pagePaddingHorizental,
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
                  children: const [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 20,
                        ),
                        child: UserFields(),
                      ),
                    ),
                    FormButtons(buttonRadius: _fieldsContainerBorderRadius),
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
