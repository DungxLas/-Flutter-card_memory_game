import 'package:card_memory_game/data/model/image_q.dart';
import 'package:card_memory_game/widgets/end_game/countdown_timer.dart';
import 'package:card_memory_game/widgets/play_screen/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/card_provider.dart';

class PlayScreen extends ConsumerStatefulWidget {
  const PlayScreen({super.key});

  @override
  ConsumerState<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends ConsumerState<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    List<ImageQ> cardData = ref.watch(listCard);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const CountdownTimer(
              start: 5,
            ),
            GridItem(data: cardData),
          ],
        ),
      ),
    );
  }
}
