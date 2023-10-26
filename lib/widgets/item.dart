import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item(
      {super.key,
      required this.path,
      required this.click,
      required this.cardKey});

  final String? path;
  final Function click;
  final GlobalKey<FlipCardState> cardKey;

  @override
  Widget build(BuildContext context) {
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
          // Future.delayed(Duration(seconds: 2), () {
          //   cardKey.currentState!.toggleCard();
          // });
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
          // bool check = click();
          // if (!check) {
          //   Future.delayed(const Duration(seconds: 2), () {
          //     cardKey.currentState!.toggleCard();
          //   });
          // }
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
