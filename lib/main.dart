import 'package:flutter/material.dart';
import 'package:genswap/home/home.dart';

void main() {
  runApp(const GenSwap());
}

class GenSwap extends StatelessWidget {
  const GenSwap({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GenSwap',
      home: HomePage(),
    );
  }
}
