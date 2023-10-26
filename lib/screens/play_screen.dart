import 'package:flutter/material.dart';

import '../data/collection.dart';
import '../data/model/images_list.dart';
import '../widgets/item.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final ImagesList imageData = data.createQuiz();

  int itemCheck = 0;
  List<String> itemClicked = [];

  void checkResult(String item) {
    // setState(() {
    //   //them anh vao list xem xet
    //   itemCheck++;
    //   itemClicked.add(item);

    //   if (itemCheck == 2) {
    //     itemCheck = 0;
    //     //kiem tra ket qua
    //     if (itemClicked[0] == itemClicked[1]) {
    //       print('dung');
    //     } else {
    //       print('sai');
    //     }
    //     itemClicked.clear();
    //     return;
    //   }
    // });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        children: [
          ...imageData.list.map((item) => Item(
                path: item.front,
                click: () => checkResult(item.id),
              )),
          Text(itemCheck.toString()),
        ],
      ),
    );
  }
}
