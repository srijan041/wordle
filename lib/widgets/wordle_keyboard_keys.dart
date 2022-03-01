import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/provider/game_state_provider.dart';

class KeyCaps extends ConsumerWidget {
  final String letter;

  const KeyCaps(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    Color keyColor = Colors.grey.shade800;

    return InkWell(
      onTap: () {
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(),
          color: keyColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: keys,
        ),
      ),
    );
  }
}
