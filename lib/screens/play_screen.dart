import 'package:card_memory_game/data/model/image_q.dart';
import 'package:card_memory_game/widgets/countdown_timer.dart';
import 'package:card_memory_game/widgets/gridItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/card_provider.dart';

class PlayScreen extends ConsumerStatefulWidget {
  const PlayScreen({super.key});

  @override
  ConsumerState<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends ConsumerState<PlayScreen> {
  //List<Widget> gridCard = <Widget>[];

  // void hideItem(String id) {
  //   int index1 = cardData.indexWhere((element) => element.id == id);
  //   int index2 = cardData.indexWhere((element) => element.id == id, index1);

  //   ImageQ xxx = const ImageQ(id: 'xxx', front: 'lib/assets/image/OIG.jpg');

  //   setState(() {
  //     // gridCard[index1] = xxx as Widget;
  //     // gridCard[index2] = xxx as Widget;
  //     // gridCard.removeAt(index1);
  //     // gridCard.removeAt(index2);
  //     gridCard = [];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<ImageQ> cardData = ref.watch(listCard);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const CountdownTimer(
              start: 30,
            ),
            GridItem(data: cardData),
          ],
        ),
      ),
    );
  }
}
