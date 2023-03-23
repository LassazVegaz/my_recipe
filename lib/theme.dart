import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var _buttonBorderShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

const _h1TextStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);

const primaryColor = Color(0xff324E97);

const fieldBorderRadius = BorderRadius.all(Radius.circular(8));
const fieldVerticalGap = 24.0;

const listItemBackground = Color.fromARGB(58, 217, 217, 217);
const listItemBorderRadius = fieldBorderRadius;

const pagePaddingHorizental = 30.0;

const formButtonWidth = 90.0;

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: Colors.white,
  ).copyWith(
    primary: primaryColor,
    secondary: const Color(0xff973232),
  ),
  textTheme: const TextTheme(
    headline1: _h1TextStyle,
    headline2: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: _h1TextStyle,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 20,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      shape: _buttonBorderShape,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      shape: _buttonBorderShape,
      side: const BorderSide(
        color: primaryColor,
        width: 1,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    ),
  ),
);
