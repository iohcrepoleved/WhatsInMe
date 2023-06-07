import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_musical/screens/home_screen2.dart';

void main() async {
  // timeDilation = 3.0;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen2(),
    );
  }
}
