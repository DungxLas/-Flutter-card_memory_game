//import 'dart:io';

import 'dart:math';

import 'package:card_memory_game/widgets/item.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  PlayScreen({super.key});

  final List<Map<String, String>> imageData = [
    {'animal': 'dog', 'image': 'lib/assets/image/dog.png'},
    {'animal': 'cat', 'image': 'lib/assets/image/cat.png'},
    {'animal': 'cat', 'image': 'lib/assets/image/bird.png'}
  ];

  @override
  Widget build(BuildContext context) {
    var random = Random();
    final List<Map<String, String>> imageRd = [...imageData, ...imageData];
    imageRd.shuffle(random);

    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        children: [
          ...imageRd.map((item) => Item(path: item['image'])),
        ],
      ),
    );
  }
}
