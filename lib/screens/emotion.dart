import 'package:flutter/material.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({super.key});
  @override
  State<EmotionScreen> createState() {
    return _EmotionScreenState();
  }
}

class _EmotionScreenState extends State<EmotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}