import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'LeFrigo',
            style: TextStyle(
              fontFamily:
                  'KaiseiOpti', // Use the font family name you defined in pubspec.yaml
              fontSize: 36.0, // Adjust the font size as needed
            ),
          ),
        ),
      ),
    );
  }
}
