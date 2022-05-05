import 'package:flutter/material.dart';
import 'package:newzapp/signup.dart';
import 'home_page.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/homePage',
    routes: {
      // '/': (context) => const LoadingScreen(),
      '/homePage': (context) => const HomePage(),
      '/signup': (context) => const SignUp(),
      '/login': (context) => const Login(),
    },
  ));
}
