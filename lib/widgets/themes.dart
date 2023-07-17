import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        primaryColor: Colors.black,
        primaryColorLight: darkBluisColor,
        // / buttonColor: darkBluisColor,
        // accentColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      primaryColor: Colors.white,
      primaryColorLight: lightBluisColor,
      // buttonColor: lightBluisColor,
      // accentColor: Colors.white,
      // buttonTheme: ButtonThemeData(buttonColor: darkBluisColor),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        // textTheme: Theme.of(context).textTheme.copyWith(headline6:TextStyle(color: Colors.white),),
        // titleTextStyle: Theme.of(context).textTheme.headline6,
      ));

  // colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluisColor = const Color(0xff403b58);
  static Color lightBluisColor = Vx.indigo500;
}
