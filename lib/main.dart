import 'package:flutter/material.dart';
import 'package:projectflutternew/note/home_screen.dart';
import 'login_screen.dart';
import 'note/test_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Chat',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

