import 'package:flutter/material.dart';

class KeyCaps extends StatelessWidget {
  final String letter;

  const KeyCaps(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = 50.0;
    var width = 35.0;
    Widget keys;
    if (letter == ',') {
      width = 50;
      keys = const Icon(
        Icons.keyboard_return,
        color: Colors.white,
        size: 18,
      );
    } else if (letter == '.') {
      width = 50;
      keys = const Icon(
        Icons.backspace_outlined,
        color: Colors.white,
        size: 18,
      );
    } else {
      keys = Text(
        letter,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      );
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: keys,
      ),
    );
  }
}
