import 'package:flutter/material.dart';
import 'package:lefrigo/routes/routes.dart';
import 'favorite/favorite.dart';
import 'fridge/fridge.dart';
import 'profile/profile.dart';
import 'home/home.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NavigationBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigationBarApp(),
    );
  }
}

class MyNavigationBarApp extends StatefulWidget {
  @override
  _MyNavigationBarAppState createState() => _MyNavigationBarAppState();
}

class _MyNavigationBarAppState extends State<MyNavigationBarApp> {
  int _currentIndex = 0;

  final screens = [
    HomePage(),
    FridgePage(),
    ThirdScreen(),
    FavoritePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: buildMyNavigationBar(context),
    );
  }

  Container buildMyNavigationBar(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: _currentIndex == 0
                  ? Icon(
                      Icons.home_outlined,
                      color: Color(0xFFE25E3E),
                      size: 30,
                    )
                  : Icon(Icons.home_outlined,
                      color: Color(0xFF202A44),
                      size: 30) // Replace with your desired icon
              ),
          IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: _currentIndex == 1
                  ? Icon(Icons.shopping_basket_outlined,
                      color: Color(0xFFE25E3E), size: 30)
                  : Icon(Icons.shopping_basket_outlined,
                      color: Color(0xFF202A44),
                      size: 30) // Replace with your desired icon
              ),
          IconButton(
              onPressed: () {
                context.router.push(UploadRoute());
              },
              icon: _currentIndex == 2
                  ? Icon(Icons.add_circle, color: Color(0xFFE25E3E), size: 30)
                  : Icon(Icons.add_circle,
                      color: Color(0xFF202A44),
                      size: 30) // Replace with your desired icon
              ),
          IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              icon: _currentIndex == 3
                  ? Icon(Icons.bookmark_outline,
                      color: Color(0xFFE25E3E), size: 30)
                  : Icon(Icons.bookmark_outline,
                      color: Color(0xFF202A44),
                      size: 30) // Replace with your desired icon
              ),
          IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 4;
                });
              },
              icon: _currentIndex == 4
                  ? Icon(Icons.person_2_outlined,
                      color: Color(0xFFE25E3E), size: 30)
                  : Icon(Icons.person_2_outlined,
                      color: Color(0xFF202A44),
                      size: 30) // Replace with your desired icon
              ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
