
import 'package:flutter/material.dart';
import 'package:untitled4/homePage.dart';

void main() {
  runApp(MatrixMultiplyApp());
}

class MatrixMultiplyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix Multiplier',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

