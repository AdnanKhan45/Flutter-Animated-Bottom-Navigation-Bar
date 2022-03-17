import 'package:animated_navigation_bar/pages/favorite_page.dart';
import 'package:animated_navigation_bar/pages/home_page.dart';
import 'package:animated_navigation_bar/pages/profile_page.dart';
import 'package:animated_navigation_bar/pages/search_page.dart';
import 'package:animated_navigation_bar/pages/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> screens = [
    HomePageWidget(),
    SearchPage(),
    FavoritePage(),
    SettingsPage(),
    ProfilePage()
  ];

  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Animated Bottom Navigation Bar"),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white)
        ),
        child: CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          color: Colors.blueAccent,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          height: 60,
          index: index,
          items: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.favorite),
            Icon(Icons.settings),
            Icon(Icons.image),
          ],
        ),
      ),
      body: screens[index],
    );
  }
}

