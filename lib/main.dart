import 'package:dry_app/pages/Board_Page.dart';
import 'package:dry_app/pages/home_page.dart';
import 'package:dry_app/pages/login_page.dart';
import 'package:dry_app/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.boardRoute,
      routes: {
        "/": (context) => const BoardPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.boardRoute: (context) => const BoardPage()
      },
    );
  }
}
