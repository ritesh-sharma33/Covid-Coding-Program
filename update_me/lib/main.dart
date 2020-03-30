import 'package:flutter/material.dart';
import 'package:update_me/pages/splash_page.dart';
import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Me',
      home: new SplashPage(),
    );
  }
}