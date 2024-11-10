import 'package:flutter/material.dart';
import 'package:app_with_nav/pages/home.dart';
import 'package:app_with_nav/pages/loading.dart';
import 'package:app_with_nav/pages/choose_location.dart';
import 'package:app_with_nav/pages/second_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(fixedSize: const Size(250, 50)))),
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/choose_location': (context) => const ChooseLocation(),
      '/second_page': (context) => const SecondPage(),
    },
  ));
}
