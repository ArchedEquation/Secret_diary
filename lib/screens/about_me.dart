import 'package:flutter/material.dart';
import 'package:secret_diary/widgets/text_box.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text(
          "A B O U T  D E V",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Image.asset(
              'assets/images/arch-cat.png',
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const TextBox(
            text:
                " I am  Praneeth Yeddu aka ArchedEquation , thy father of this app",
            fontsize: 20,
          ),
          const TextBox(
            text: "Currently in 2nd year at the time of the creation of App. ",
            fontsize: 20,
          ),
          const TextBox(
              text:
                  "I created this app to store my inner thoughts , basically a virtual diary to keep it with you all the time and also a random positive quote generator to help you move forward ",
              fontsize: 20),
          const TextBox(
              text:
                  "I will keep on updating this app according to my mood swings , and will also try to add more innovative features to level up my mobile devlopment skills ",
              fontsize: 20),
        ],
      ),
    );
  }
}
