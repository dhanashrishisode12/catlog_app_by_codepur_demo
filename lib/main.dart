import 'package:catlog_app_by_codepur_demo/pages/home_page.dart';
import 'package:catlog_app_by_codepur_demo/pages/login_page.dart';
import 'package:catlog_app_by_codepur_demo/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      // initialRoute: "/homePage",
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute : (context) => const HomePage(),
        MyRoutes.loginRoute : (context) => const LoginPage(),
      },
    );
  }
}
