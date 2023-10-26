import 'package:card_memory_game/data/model/image_q.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../data/collection.dart';
import '../widgets/item.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final List<ImageQ> imageData = data.createQuiz().list;

  int itemCheck = 0;
  List<ImageQ> itemClicked = [];

  // bool checkResult(String item) {
  //   itemCheck++;
  //   itemClicked.add(item);

  //   if (itemCheck == 2) {
  //     itemCheck = 0;
  //     //kiem tra ket qua
  //     if (itemClicked[0] == itemClicked[1]) {
  //       print('dung');
  //       itemClicked.clear();
  //       return true;
  //     } else {
  //       print('sai');
  //       itemClicked.clear();
  //     }
  //   }

  //   return false;
  // }
  void checkResult(ImageQ item) {
    itemClicked.add(item);

    if (itemClicked.length == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cardData = [
      ...imageData.map((e) => {
            'imageData': e,
            'key': GlobalKey<FlipCardState>(),
          })
    ];
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        children: [
          ...cardData.map((item) {
            return Item(
              path: item['imageData'].front,
              click: () {}, //checkResult(item.id),
              cardKey: item['key'],
            );
          }),
          Text(itemCheck.toString()),
        ],
      ),
    );
  }
}
