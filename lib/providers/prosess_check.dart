import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProcessCheckNotifier extends StateNotifier<bool> {
  ProcessCheckNotifier() : super(false);

  bool status() {
    return state;
  }

  void change(bool isProcess) {
    state = isProcess;
  }
}

final processCheck = StateNotifierProvider<ProcessCheckNotifier, bool>((ref) {
  return ProcessCheckNotifier();
});
