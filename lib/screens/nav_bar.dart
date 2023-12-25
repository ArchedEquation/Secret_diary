import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secret_diary/screens/about_me.dart';
import 'package:secret_diary/screens/about_you.dart';
import 'package:secret_diary/screens/emotion.dart';
import 'package:secret_diary/screens/notes.dart';
import 'package:secret_diary/screens/quote.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() {
    return _NavBarScreenState();
  }
}

class _NavBarScreenState extends State<NavBarScreen> {
  int Myindex = 0;
  final List<Widget> _children = const [
    NotesScreen(),
    AboutYouScreen(),
    EmotionScreen(),
    QuoteScreen(),
    AboutMeScreen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      Myindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[Myindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Myindex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "Your Notes",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_3),
                label: "About You",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.emoji_emotions),
                label: "Emotions",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.question_answer_sharp),
                label: "Random Quotes",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "About Me",
                backgroundColor: Theme.of(context).colorScheme.primary),
          ]),
    );
  }
}
