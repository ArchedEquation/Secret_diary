import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final double fontsize;

  const TextBox({super.key, required this.text, required this.fontsize});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: fontsize),
          )
        ],
      ),
    );
  }
}
