import 'dart:async';

import 'package:card_memory_game/providers/match_provider.dart';
import 'package:card_memory_game/widgets/end_game/timeout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownTimer extends ConsumerStatefulWidget {
  const CountdownTimer({Key? key, required this.start}) : super(key: key);
  final int start;

  @override
  ConsumerState<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends ConsumerState<CountdownTimer> {
  late Timer _timer;
  late int _seconds;

  @override
  void initState() {
    super.initState();
    _seconds = widget.start;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => setState(
        () {
          if (ref.watch(matchChecked)) {
            timer.cancel();
            showDialog(
              context: context,
              barrierDismissible:
                  false, // Ko cho phép đóng hộp thoại khi nhấn bên ngoài
              barrierColor: Colors.black87,
              builder: (BuildContext context) {
                return const TimeOutDialog(
                  title: 'Congratulation!!!',
                  content:
                      'You have completed the challenge. If you want to play again, click "Restart"',
                );
              },
            );
          }
          if (_seconds < 1) {
            timer.cancel();
            showDialog(
              context: context,
              barrierDismissible:
                  false, // Ko cho phép đóng hộp thoại khi nhấn bên ngoài
              barrierColor: Colors.black87,
              builder: (BuildContext context) {
                return const TimeOutDialog(
                  title: 'Time Out!!!',
                  content:
                      'Sorry, your time is up. If you want to continue the challenge, click "Restart"',
                );
              },
            );
          } else {
            --_seconds;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Thoi gian con lai: $_seconds'),
      ],
    );
  }
}
