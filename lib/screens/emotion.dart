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
      backgroundColor: const Color(0xffe6fff2),
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text('E X P R E S S  Y O U R S E L F'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
