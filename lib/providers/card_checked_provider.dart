import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardCheckedNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  CardCheckedNotifier() : super([]);

  void cardToggle(String id, GlobalKey<FlipCardState> keyCard) {
    Map<String, dynamic> newItem = {
      'id': id,
      'key': keyCard,
    };
    state = [...state, newItem];
  }

  int length() {
    return state.length;
  }

  void clear() {
    state.clear();
  }

  bool checkResult() {
    if (state[0]['id'] != state[1]['id']) {
      return false;
    }
    return true;
  }

  void flipItemCheck() {
    state[0]['key'].currentState!.toggleCard();
    state[1]['key'].currentState!.toggleCard();
  }
}

final cardChecked =
    StateNotifierProvider<CardCheckedNotifier, List<Map<String, dynamic>>>(
        (ref) {
  return CardCheckedNotifier();
});
