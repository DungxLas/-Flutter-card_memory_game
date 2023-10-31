import 'package:card_memory_game/data/model/image_q.dart';
import 'package:card_memory_game/providers/prosess_check.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/card_checked_provider.dart';

class Item extends ConsumerWidget {
  Item({super.key, required this.image, required this.onHideItem});

  final ImageQ image;
  final Function onHideItem;

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listCheck = ref.read(cardChecked.notifier);
    final isProcessing = ref.read(processCheck.notifier);
    final allowFlip = ref.watch(processCheck);
    return FlipCard(
      speed: 100,
      fill: Fill.none,
      key: cardKey,
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.BACK, // The side to initially display.
      //autoFlipDuration: const Duration(seconds: 2),
      flipOnTouch: !allowFlip,
      front: Image.asset(
        image.front,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
      back: Image.asset(
        'lib/assets/image/question_mark.png',
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
      onFlip: () {
        listCheck.cardToggle(image.id, cardKey);

        if (listCheck.length() == 2) {
          isProcessing.change(true);

          // bool check = listCheck.checkResult();
          // if (check == true) {
          //   onHideItem();
          // } else {
          //   await Future.delayed(const Duration(milliseconds: 300), () {
          //     listCheck.flipItemCheck();
          //   });
          // }
          // listCheck.clear();

          // isProcessing.change(false);
        }
      },
      onFlipDone: (isFront) async {
        if (!isFront) {
          if (listCheck.length() == 2) {
            // bool check = listCheck.checkResult();
            // if (check == true) {
            //   onHideItem();
            // } else {
            await Future.delayed(const Duration(milliseconds: 300), () {
              //listCheck.flipItemCheck();
              onHideItem();
            });
            // }
            // listCheck.clear();

            // isProcessing.change(false);
          }
        }
      },
    );
  }
}
