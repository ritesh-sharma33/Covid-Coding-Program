
import 'package:flutter/material.dart';
import 'package:updateme/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Me',
      home: HomePage()
    );
  }
}