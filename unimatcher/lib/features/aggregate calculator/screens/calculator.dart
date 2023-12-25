import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Calculator Screen',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
