import 'package:flutter/material.dart';

AppBar topBar() {
  const IconData help_sharp =
      IconData(0xea06, fontFamily: 'MaterialIcons', matchTextDirection: true);
  return AppBar(
    centerTitle: true,
    title: Text('WORDLE'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(help_sharp),
      ),
    ],
    backgroundColor: Colors.black,
  );
}
