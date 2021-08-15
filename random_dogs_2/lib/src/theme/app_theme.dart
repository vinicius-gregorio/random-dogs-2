import 'package:flutter/material.dart';
import 'package:random_dogs_2/src/theme/app_colors.dart';

final primaryColor = AppColors.primary;

Map<int, Color> color = {
  50: primaryColor,
  100: primaryColor,
  200: primaryColor,
  300: primaryColor,
  400: primaryColor,
  500: primaryColor,
  600: primaryColor,
  700: primaryColor,
  800: primaryColor,
  900: primaryColor,
};
MaterialColor customColor = MaterialColor(0xFFFF941A, color);

final TextStyle headline1 =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: primaryColor);
final TextStyle headline2 =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor);
final TextStyle headline3 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

ThemeData appTheme() {
  // final errorColor = Color(0xFFdfb9bb); The Default red color is better than this one
  return ThemeData(
    primarySwatch: customColor,
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    primaryColorLight: primaryColor,
    errorColor: AppColors.delete,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: primaryColor))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      textStyle: headline3,
      shadowColor: Colors.black,
    )),
  );
}
