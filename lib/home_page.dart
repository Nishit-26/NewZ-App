import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newzapp/Screens/feed_screen.dart';
import 'package:newzapp/Screens/profile_screen.dart';
import 'package:newzapp/Screens/saved_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = const [
    FeedScreen(),
    ProfilePage(),
    SavedScreen()
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "New",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text(
                        "Z",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
                body: _screens[currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (index) => setState(() {
                    currentIndex = index;
                  }),
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.black,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(IconlyBold.home),
                        backgroundColor: Colors.black,
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyBold.profile),
                        backgroundColor: Colors.black,
                        label: 'Profile'),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyBold.bookmark),
                        backgroundColor: Colors.black,
                        label: 'Saved'),
                  ],
                ),
              ),
            ));
  }
}
