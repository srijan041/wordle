import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/word_repo.dart';

class GameState {
  int attempted;
  String correctWord;
  List<String> validWords;
  List<String> attempts;

  GameState clone(
      {List<String>? validWords,
      String? correctWord,
      List<String>? attempts,
      int? attempted}) {
    return GameState(
        validWords: validWords ?? this.validWords,
        correctWord: correctWord ?? this.correctWord,
        attempted: attempted ?? this.attempted,
        attempts: attempts ?? this.attempts);
  }

  GameState({
    required this.validWords,
    required this.correctWord,
    required this.attempts,
    required this.attempted,
  });
}

class GameStateNotifier extends StateNotifier<GameState> {
  final Random rng = Random();

  GameStateNotifier()
      : super(
          GameState(
              validWords: [], correctWord: 'super', attempts: [], attempted: 0),
        );

  Future<void> updateWords() async {
    final words = await loadWords(5);
    state = state.clone(
        validWords: words, correctWord: words[rng.nextInt(words.length - 1)]);
  }

  void newCorrectWord() {
    state = state.clone(
        correctWord:
            state.validWords[rng.nextInt(state.validWords.length - 1)]);
  }

  void updateCurrentAttempt(String key) {
    final attempts = state.attempts;
    if (attempts.length <= state.attempted) {
      attempts.add('');
    }
    var currentAttempt = attempts[state.attempted];

    if (key == ',') {
      // enter key pressed

      if (currentAttempt.length < 5) {
        print('Insufficient word length');
        return;
      }

      if (!state.validWords.contains(currentAttempt)) {
        print("not in valid words list");
        return;
      }

      state = state.clone(attempted: state.attempted + 1);
    } else if (key == '.') {
      //backspace key pressed
      if (currentAttempt.isEmpty) {
        print("cannot backspace on empty string");
        return;
      }
      currentAttempt = currentAttempt.substring(0, currentAttempt.length - 1);
      attempts[state.attempted] = currentAttempt;
    } else {
      if (currentAttempt.length >= 5) {
        print("trying to type word longer than correct word length");
        return;
      }
      currentAttempt += key;
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    }
  }
}

final gameStateProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  final gameStateNotifier = GameStateNotifier();
  gameStateNotifier.updateWords();
  return gameStateNotifier;
});
