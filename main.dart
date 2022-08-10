import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF151026),
        ),
      ),
      title: 'Welkom in de quiz app',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 123, 123, 123),
        appBar: AppBar(
          title: const Text('Welkom in de Quiz app'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BeginQuiz()),
                );
              },
              style: ElevatedButton.styleFrom(primary: const Color(0xFF151026)),
              child: const Text('Begin de Quiz!')),
        ),
      ),
    );
  }
}

class BeginQuiz extends StatelessWidget {
  const BeginQuiz({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(child: ,)
      ),
    );
  }
}
