import 'package:calcunvertor/pages/Calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
  ));
}

// creating calculator page
