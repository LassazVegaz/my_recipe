import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/user_fields.dart';

// margin top ratio of the fields container with respect to the screen height
const _marginTopR = 0.47;
const _fieldsContainerHeightR = 0.48; // with respect to the screen height
// extra image height that goes below the fields container
const _extraImageHeight = 100;
// border radius of fields container
const _fieldsContainerBorderRadius = 30.0;
// form button radius
const _buttonRadius = Radius.circular(
  _fieldsContainerBorderRadius,
);
// form button padding
const _buttonPadding = EdgeInsets.symmetric(
  vertical: 25,
);

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
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.8, 1],
                  ).createShader(
                    Rect.fromLTRB(
                      0,
                      0,
                      rect.width,
                      rect.height,
                    ),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  "assets/temp_1.jpg",
                  height: fieldsContainerTopMargin + _extraImageHeight,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
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
                  borderRadius:
                      BorderRadius.circular(_fieldsContainerBorderRadius),
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
                    FormButtons(),
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

class FormButtons extends StatelessWidget {
  const FormButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: _buttonRadius,
                ),
              ),
              padding: _buttonPadding,
            ),
            child: const Text('Update'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: _buttonRadius,
                ),
              ),
              padding: _buttonPadding,
            ),
            child: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
