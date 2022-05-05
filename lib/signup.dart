import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newzapp/Authentication/signup_user.dart';
import 'package:newzapp/Helper/validation.dart';

import 'Models/user_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => SafeArea(
              child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFields(
                        hint: "Username",
                        controller: _usernameController,
                        obscureTextValue: false),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFields(
                        hint: "Email",
                        controller: _emailController,
                        obscureTextValue: false),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFields(
                        hint: "Password",
                        controller: _passwordController,
                        obscureTextValue: true),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFields(
                        hint: "Confirm Password",
                        controller: _confirmPassController,
                        obscureTextValue: true),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () async {
                              // // await ValidateSignup(
                              // //     username: _usernameController.text,
                              // //     email: _emailController.text,
                              // //     password: _passwordController.text,
                              // //     confirmPass: _confirmPassController.text,
                              // //     context: context);
                              // await SignupUser(
                              //     _emailController,
                              //     _passwordController,
                              //     _usernameController,
                              //     context);
                              Navigator.pushReplacementNamed(
                                  context, "/HomePage");
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushReplacementNamed(context, '/LogIn');
                          });
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

// ignore: must_be_immutable
class TextFields extends StatelessWidget {
  String hint;
  TextEditingController controller;
  bool obscureTextValue;
  TextFields(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.obscureTextValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureTextValue,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: hint,
            hintStyle: const TextStyle(fontFamily: 'Lato')),
        cursorColor: Colors.black.withOpacity(0.2),
        cursorHeight: 20,
      ),
    );
  }
}

// ignore: non_constant_identifier_names
SignupUser(
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController usernameController,
    BuildContext context) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, password: passwordController.text);

  UserModel user =
      UserModel(username: usernameController.text, email: emailController.text);

  User? fUser = FirebaseAuth.instance.currentUser;

  await FirebaseFirestore.instance
      .collection("users")
      .doc(fUser?.uid.toString())
      .set({"username": usernameController.text});

  Navigator.pushReplacementNamed(context, '/HomePage');
}
