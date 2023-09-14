import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 120,
        ),
      ),
    );
  }
}
