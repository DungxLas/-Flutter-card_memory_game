import 'package:card_memory_game/data/model/image_q.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../providers/card_checked_provider.dart';

// class Item extends ConsumerStatefulWidget {
//   Item({super.key, required this.image, required this.isProcessing});

//   final ImageQ image;
//   final ValueNotifier<bool> isProcessing;

//   final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

//   @override
//   ConsumerState<Item> createState() => _ItemState();
// }

// class _ItemState extends ConsumerState<Item> {
//   void _performTask() async {
//     // final token = const Uuid().v4();
//     // listCheck.cardToggle(
//     //     token, widget.image.id, widget.cardKey);

//     // if (listCheck.length() % 2 == 0) {
//     //   // kiem tra
//     //   widget.isProcessing.value = false;

//     //   //listCheck.checkResult(token);
//     //   await Future.delayed(Duration(seconds: 5));

//     //   widget.isProcessing.value = false;
//     // }
//     widget.isProcessing.value = true;

//     //listCheck.checkResult(token);
//     widget.cardKey.currentState!.toggleCard();
//     print(widget.isProcessing);
//     await Future.delayed(Duration(seconds: 10));

//     widget.isProcessing.value = false;
//     print(widget.isProcessing);
//   }

//   @override
//   Widget build(BuildContext context) {
//     //final listCheck = ref.read(cardChecked.notifier);
//     return FlipCard(
//       // fill: Fill
//       //     .fillBack, // Fill the back side of the card to make in the same size as the front.
//       key: widget.cardKey,
//       direction: FlipDirection.HORIZONTAL, // default
//       side: CardSide.BACK, // The side to initially display.
//       //autoFlipDuration: const Duration(seconds: 2),
//       front: GestureDetector(
//         onTap: () {
//           //cardKey.currentState!.toggleCard();
//         },
//         child: Image.asset(
//           widget.image.front,
//           height: 50,
//           width: 50,
//           fit: BoxFit.cover,
//         ),
//       ),
//       back: ValueListenableBuilder(
//           valueListenable: widget.isProcessing,
//           builder: (context, bool isProcessing, _) {
//             return GestureDetector(
//               onTap: isProcessing ? null : _performTask,
//               child: Image.asset(
//                 'lib/assets/image/question_mark.png',
//                 height: 50,
//                 width: 50,
//                 fit: BoxFit.cover,
//               ),
//             );
//           }),
//     );
//   }
// }

class Item extends StatelessWidget {
  Item({super.key, required this.image, required this.isProcessing});

  final ImageQ image;
  final ValueNotifier<bool> isProcessing;

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  void _performTask() async {
    // final token = const Uuid().v4();
    // listCheck.cardToggle(
    //     token, widget.image.id, widget.cardKey);

    // if (listCheck.length() % 2 == 0) {
    //   // kiem tra
    //   widget.isProcessing.value = false;

    //   //listCheck.checkResult(token);
    //   await Future.delayed(Duration(seconds: 5));

    //   widget.isProcessing.value = false;
    // }
    isProcessing.value = true;

    //listCheck.checkResult(token);
    cardKey.currentState!.toggleCard();
    await Future.delayed(Duration(seconds: 10));

    isProcessing.value = false;
  }

  @override
  Widget build(BuildContext context) {
    //final listCheck = ref.read(cardChecked.notifier);
    return FlipCard(
      // fill: Fill
      //     .fillBack, // Fill the back side of the card to make in the same size as the front.
      key: cardKey,
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.BACK, // The side to initially display.
      //autoFlipDuration: const Duration(seconds: 2),
      front: GestureDetector(
        onTap: () {
          //cardKey.currentState!.toggleCard();
        },
        child: Image.asset(
          image.front,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      back: ValueListenableBuilder(
          valueListenable: isProcessing,
          builder: (context, bool isProcessing, _) {
            return GestureDetector(
              onTap: isProcessing ? null : _performTask,
              child: Image.asset(
                'lib/assets/image/question_mark.png',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
