import 'package:chat_app/pages/homepage/home_page.dart';
import 'package:chat_app/pages/navigations/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true),
        home: const NavHomePage());
  }
}
