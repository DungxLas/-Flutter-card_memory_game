import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.path, required this.click});

  final String? path;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => click(),
      child: Image.asset(
        path!,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
