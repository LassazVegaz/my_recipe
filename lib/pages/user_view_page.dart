import 'package:flutter/material.dart';
import 'package:my_recipe/theme.dart';

// margin top ratio of the fields container with respect to the screen height
const _marginTopR = 0.4;
const _fieldsContainerHeightR = 0.45; // with respect to the screen height
// extra image height that goes below the fields container
const _extraImageHeight = 50;

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
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Text("Hello"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
