import 'package:flutter/material.dart';

class TimeOutDialog extends StatefulWidget {
  const TimeOutDialog({Key? key}) : super(key: key);

  @override
  State<TimeOutDialog> createState() => _TimeOutDialogState();
}

class _TimeOutDialogState extends State<TimeOutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Notice'),
      content: const Text('Time Out'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/start_screen');
          },
          child: const Text('Restart'),
        ),
      ],
    );
  }
}
