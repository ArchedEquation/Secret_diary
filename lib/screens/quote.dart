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
  ];
  late Timer timer;
  bool cangetquote = true;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic((const Duration(hours: 12)), (Timer t) {
      setState(() {
        cangetquote = true;
      });
    });
  }

  Random random = Random();
  String currentQuote = '';

  void _getQuote() {
    if (cangetquote) {
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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Q U O T E  R A N D O M I Z E R",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Colors.lightGreenAccent,
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
                                  maxLines: 2,
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
                color: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Text(
                      "Click this button for a random positive quote",
                      maxLines: 2,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.arrow_downward_sharp,
                      size: 42,
                    ),
                    ElevatedButton(
                        onPressed: _getQuote,
                        child: const Text("Click me UwU")),
                  ],
                ),
              ),
              Card(
                color: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  currentQuote,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
