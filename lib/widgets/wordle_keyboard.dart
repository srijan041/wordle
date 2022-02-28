import 'package:flutter/cupertino.dart';
import 'package:wordle/widgets/wordle_keyboard_keys.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (var i in 'QWERTYUIOP'.split('')) KeyCaps(i)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (var i in 'ASDFGHJKL'.split('')) KeyCaps(i)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (var i in ',ZXCVBNM.'.split('')) KeyCaps(i)],
        ),
      ],
    );
  }
}
