import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';
import 'package:my_recipe/widgets/user_fields.dart';

// margin top ratio of the fields container with respect to the screen height
const _marginTopR = 0.4;
const _fieldsContainerHeightR = 0.45; // with respect to the screen height
// extra image height that goes below the fields container
const _extraImageHeight = 50;
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
        title: Text(
          'Hiru Weerasinghe',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/temp_1.jpg",
                height: fieldsContainerTopMargin + _extraImageHeight,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 218, 220, 231),
                ),
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
                  color: const Color.fromARGB(255, 191, 193, 205),
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
