import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/item.dart';
import '../providers/card_provider.dart';

class PlayScreen extends ConsumerStatefulWidget {
  const PlayScreen({super.key});

  @override
  ConsumerState<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends ConsumerState<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    final cardData = ref.watch(listCard);

    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        children: [
          ...cardData.map((item) {
            return Item(
              image: item,
            );
          }),
          //Text(itemCheck.toString()),
        ],
      ),
    );
  }
}
