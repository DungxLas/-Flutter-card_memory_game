import 'package:flutter/material.dart';

class TimeOutDialog extends StatelessWidget {
  const TimeOutDialog({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
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
