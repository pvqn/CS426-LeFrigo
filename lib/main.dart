import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cs426final/navigation_bar.dart';
import 'package:cs426final/category.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Attempt to initialize Firebase using the default platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // If the default initialization fails or you want to use custom options, fall back to custom options

  runApp(Category());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
