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
          title: const Text('HOW ARE YOU FEELING TODAY'),
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
        body: Center(
          child: Column(
            children: [
              Transform(
                transform: Matrix4.translationValues(0, 80, 0),
                child: Text(
                  "How are you feeling today???",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(0, 100, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text(
                    "HAPPY!!!!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(0, 120, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text(
                    "SAD :(",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(0, 140, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text(
                    "CONFUSED???",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(0, 160, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child:  const Text(
                    "ANGRY",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
