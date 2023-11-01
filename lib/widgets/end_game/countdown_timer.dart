import 'dart:async';

import 'package:card_memory_game/widgets/end_game/timeout_dialog.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key, required this.start});
  final int start;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
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
          if (_seconds < 1) {
            timer.cancel();
            showDialog(
              context: context,
              barrierDismissible:
                  true, // Ngăn chặn việc đóng hộp thoại khi nhấn bên ngoài
              builder: (BuildContext context) {
                return const TimeOutDialog();
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