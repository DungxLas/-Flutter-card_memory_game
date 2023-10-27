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
}

final cardChecked =
    StateNotifierProvider<CardCheckedNotifier, List<Map<String, dynamic>>>(
        (ref) {
  return CardCheckedNotifier();
});
