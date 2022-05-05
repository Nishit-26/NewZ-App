import 'package:flutter/material.dart';
import 'package:newzapp/signup.dart';
import 'home_page.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/LogIn',
    routes: {
      // '/': (context) => const LoadingScreen(),
      '/HomePage': (context) => const HomePage(),
      '/SignUp': (context) => const SignUp(),
      '/LogIn': (context) => const Login(),
    },
  ));
}
