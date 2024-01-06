import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});
  @override
  State<QuoteScreen> createState() {
    return _QuoteScreenState();
  }
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<String> quotes = [
    'You may not be there yet, but You arecloser than I was yesterday',
    'Life is like a bicycle  to keep your balance, you must keep moving, even if it is at a wobbly pace.',
    'Your not a smart aleck; You are the witty descendant of geniuses',
    'If at first, you do not succeed, skydiving is not for you.',
    'You are not a mess, you are a masterpiece in progress.',
    'You are  not lazy, You are in energy-saving mode.',
    'If opportunity does not knock, build a door  and maybe install a peephole for good measure',
    'I am not late, everyone else is just early.',
    'Do not watch the clock; do what it does. Keep going, and occasionally check if there is cake',
    'If life gives you lemons, make sure they are not disguised as hand grenades',
    'If you stumble, make it part of the dance – the cha-cha-cha of resilience'
  ];

  late Timer timer;
  bool cangetquote = true;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic((const Duration(seconds: 3)), (Timer t) {
      setState(() {
        cangetquote = false;
      });
    });
  }

  Random random = Random();
  String currentQuote = '';

  void _getQuote() {
    if (!cangetquote) {
      int index = random.nextInt(quotes.length);
      setState(() {
        currentQuote = quotes[index];
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6fff2),
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text('Q U O T E  R A N D O M I Z E R'),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: const Color(0xffe6fff2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/quote-cat.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Container(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(height: 5),
                                // Add a title widget
                                Text(
                                  "Random Quote Generator",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Add some spacing between the title and the subtitle
                                Container(height: 10),
                                // Add a subtitle widget
                                Text(
                                  "A non toxic addition to this toxic world",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),

                                Container(height: 10),

                                Text(
                                  "This page would provide you a random quote to keep yourself moving ahead",
                                  maxLines: 3,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: const Color(0xffe6fff2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Text(
                      "Click this button for a random  quote",
                      maxLines: 2,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Icon(
                      Icons.arrow_downward_sharp,
                      size: 72,
                    ),
                    ElevatedButton(
                        onPressed: _getQuote,
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            fixedSize: const Size(300, 30)),
                        child: const Text("Click me UwU")),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Card(
                color: const Color(0xffe6fff2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  currentQuote,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
