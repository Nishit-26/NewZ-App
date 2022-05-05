import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    "https://phantom-marca.unidadeditorial.es/98c8f9c58e54b477dac2ef7ba89df382/resize/1320/f/jpg/assets/multimedia/imagenes/2021/10/17/16345007851976.jpg"),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "John Wick",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "JohnWick@gmail.com",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/LogIn");
                },
                child: const Text("Log out"))
          ],
        ),
      ),
    ));
  }
}
