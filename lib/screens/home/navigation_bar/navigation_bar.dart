import 'package:flutter/material.dart';
import 'package:lefrigo/routes/routes.dart';
import 'favorite/favorite.dart';
import 'fridge/fridge.dart';
import 'profile/profile.dart';
import 'home/home.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyNavigationBarApp();
  }
}

class MyNavigationBarApp extends StatefulWidget {
  const MyNavigationBarApp({super.key});

  @override
  MyNavigationBarAppState createState() => MyNavigationBarAppState();
}

class MyNavigationBarAppState extends State<MyNavigationBarApp> {
  int _currentIndex = 0;

  final screens = [
    const HomePage(),
    const FridgePage(),
    const ThirdScreen(),
    FavoritePage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                                        
      body: screens[_currentIndex],
      bottomNavigationBar: buildMyNavigationBar(context),
    );
  }

  Widget buildMyNavigationBar(BuildContext context) {
    return SizedBox(
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
                  ? const Icon(
                      Icons.home_outlined,
                      color: Color(0xFFE25E3E),
                      size: 30,
                    )
                  : const Icon(Icons.home_outlined,
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
                  ? const Icon(Icons.shopping_basket_outlined,
                      color: Color(0xFFE25E3E), size: 30)
                  : const Icon(Icons.shopping_basket_outlined,
                      color: Color(0xFF202A44),
                      size: 30) // Replace with your desired icon
              ),
          IconButton(
              onPressed: () {
                context.router.push(const UploadRoute());
              },
              icon: _currentIndex == 2
                  ? const Icon(Icons.add_circle,
                      color: Color(0xFFE25E3E), size: 30)
                  : const Icon(Icons.add_circle,
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
                  ? const Icon(Icons.bookmark_outline,
                      color: Color(0xFFE25E3E), size: 30)
                  : const Icon(Icons.bookmark_outline,
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
                  ? const Icon(Icons.person_2_outlined,
                      color: Color(0xFFE25E3E), size: 30)
                  : const Icon(Icons.person_2_outlined,
                      color: Color(0xFF202A44),
                      size: 30) // Replace with your desired icon
              ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Screen'),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
