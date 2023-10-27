import 'package:card_memory_game/data/model/image_q.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/card_checked_provider.dart';

class Item extends ConsumerWidget {
  Item({super.key, required this.image});

  final ImageQ image;

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ss = ref.read(cardChecked.notifier);
    return FlipCard(
      // fill: Fill
      //     .fillBack, // Fill the back side of the card to make in the same size as the front.
      key: cardKey,
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.BACK, // The side to initially display.
      //autoFlipDuration: const Duration(seconds: 2),
      front: GestureDetector(
        onTap: () {
          cardKey.currentState!.toggleCard();
        },
        child: Image.asset(
          image.front,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      back: GestureDetector(
        onTap: () {
          cardKey.currentState!.toggleCard();

          ss.cardToggle(image.id, cardKey);
          if (ss.length() >= 2) {
            // kiem tra
          }
        },
        child: Image.asset(
          'lib/assets/image/question_mark.png',
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
