//import 'dart:io';

import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.path});

  final String? path;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(
        path!,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
