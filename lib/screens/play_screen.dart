import 'dart:math';

import 'package:card_memory_game/data/collection.dart';
import 'package:card_memory_game/widgets/item.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  var random = Random();
  final List<Map<String, String>> image = imageData;

  int itemCheck = 0;
  List<String> itemClicked = [];

  void checkResult(String item) {
    setState(() {
      //them anh vao list xem xet
      itemCheck++;
      itemClicked.add(item);

      if (itemCheck == 2) {
        itemCheck = 0;
        //kiem tra ket qua
        if (itemClicked[0] == itemClicked[1]) {
          print('dung');
        } else {
          print('sai');
        }
        itemClicked.clear();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        children: [
          ...image.map((item) => Item(
                path: item['image'],
                click: () => checkResult(item['animal']!),
              )),
          Text(itemCheck.toString()),
        ],
      ),
    );
  }
}
