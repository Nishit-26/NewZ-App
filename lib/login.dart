import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                        "Login",
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
                        hint: "Password",
                        controller: _passwordController,
                        obscureTextValue: true),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () async {
                              // ValidateSignup(
                              //     username: _usernameController.text,
                              //     password: _passwordController.text,
                              //     context: context);
                              Navigator.pushReplacementNamed(
                                  context, '/HomePage');
                            },
                            child: const Text(
                              "Log in",
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
                            Navigator.pushReplacementNamed(context, '/SignUp');
                          });
                        },
                        child: const Text(
                          "Signup",
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
