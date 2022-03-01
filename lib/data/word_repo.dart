import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<String>> getWordsFromAssets()  async {
  final data = await rootBundle.loadString("assets/words");

  return jsonDecode(data);
}

class WOTD {
  //word of the day, choosen word
  String word = '';
  int length = 0;

  void wordRandomizer() {

  }
}
