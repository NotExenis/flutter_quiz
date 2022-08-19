import 'package:flutter/material.dart';
import './quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Quiz",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const QuizScreen(),
    );
  }
}
