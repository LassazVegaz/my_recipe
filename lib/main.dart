import 'package:flutter/material.dart';
import 'package:my_recipe/pages/sample_page.dart';
import 'package:my_recipe/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipe',
      theme: themeData,
      initialRoute: SampleScreen.path,
      routes: {
        SampleScreen.path: (context) => const SampleScreen(),
      },
    );
  }
}
