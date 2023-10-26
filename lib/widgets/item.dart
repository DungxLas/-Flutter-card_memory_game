import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({super.key, required this.path, required this.click});

  final String? path;
  final Function click;

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      // fill: Fill
      //     .fillBack, // Fill the back side of the card to make in the same size as the front.
      key: cardKey,
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.BACK, // The side to initially display.
      front: GestureDetector(
        onTap: () {
          cardKey.currentState!.toggleCard();
          //click();
        },
        child: Image.asset(
          path!,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      back: GestureDetector(
        //onTap: () => click(),
        onTap: () {
          cardKey.currentState!.toggleCard();
          click();
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
