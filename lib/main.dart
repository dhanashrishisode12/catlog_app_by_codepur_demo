import 'package:catlog_app_by_codepur_demo/pages/cart_page.dart';
import 'package:catlog_app_by_codepur_demo/pages/home_page.dart';
import 'package:catlog_app_by_codepur_demo/pages/login_page.dart';
import 'package:catlog_app_by_codepur_demo/utils/routes.dart';
import 'package:catlog_app_by_codepur_demo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/MyStore.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),

      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),

      debugShowCheckedModeBanner: false,

      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        // MyRoutes.homeDetailsRoute:(context) =>  HomePageDetail(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
