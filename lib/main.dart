import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      //'/': (context) => const LoadingScreen(),
      '/': (context) => const HomePage(),
    },
  ));
}
