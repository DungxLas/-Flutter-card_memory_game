import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardCheckedNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  CardCheckedNotifier() : super([]);

  void cardToggle(String token, String id, GlobalKey<FlipCardState> keyCard) {
    Map<String, dynamic> newItem = {
      'token': token,
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

  void checkResult(String token) {
    int index = state.indexWhere((element) => element['token'] == token);
    if (state[index - 1]['id'] != state[index]['id']) {
      Future.delayed(const Duration(seconds: 5), () {
        state[index - 1]['key'].currentState!.toggleCard();
        state[index]['key'].currentState!.toggleCard();
      });
    }
  }
}

final cardChecked =
    StateNotifierProvider<CardCheckedNotifier, List<Map<String, dynamic>>>(
        (ref) {
  return CardCheckedNotifier();
});
