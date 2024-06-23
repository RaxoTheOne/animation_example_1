import 'package:flutter/material.dart';
import '../widgets/animated_image.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      body: const Center(
        child: AnimatedImage(),
      ),
    );
  }
}