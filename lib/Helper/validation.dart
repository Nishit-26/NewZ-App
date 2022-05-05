import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ValidateSignup(
    {required String username,
    required String email,
    required String password,
    required String confirmPass,
    required BuildContext context}) {
  if (username.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      confirmPass.isEmpty) {
    SnackBar snackBar =
        const SnackBar(content: Text("All fields are required"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (password.length < 6) {
    SnackBar snackBar = const SnackBar(content: Text("Password is too short"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (confirmPass != password) {
    SnackBar snackBar = const SnackBar(content: Text("Password dosen't match"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// ValidateLogin(
//     {required String username,
//     required String password,
//     required BuildContext context}) {
//   if (username.isEmpty ||
  
//       password.isEmpty
//     ) {
//     SnackBar snackBar =
//         const SnackBar(content: Text("All fields are required"));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   } else if (password.length < 6) {
//     SnackBar snackBar = const SnackBar(content: Text("Password is too short"));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
