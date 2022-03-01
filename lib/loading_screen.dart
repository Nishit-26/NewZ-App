import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Image/fullLogo.png',
                  cacheHeight: 160,
                ),
                const SizedBox(height: 40),
                SpinKitCircle(
                  color: Colors.blue.withOpacity(0.8),
                  size: 50.0,
                  // duration: const Duration(seconds: 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
