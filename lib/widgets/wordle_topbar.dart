import 'package:flutter/material.dart';

AppBar topBar() {
  const IconData help_sharp =
      IconData(0xea06, fontFamily: 'MaterialIcons', matchTextDirection: true);
  return AppBar(
    centerTitle: true,
    title: const Text(
      'WORDLE',
      style: TextStyle(
        fontSize: 25,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(help_sharp),
      ),
    ],
    backgroundColor: Colors.black,
  );
}
