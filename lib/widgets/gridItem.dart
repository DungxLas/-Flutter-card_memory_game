import 'package:flutter/material.dart';

import '../data/model/image_q.dart';
import 'item.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.data});

  final List<ImageQ> data;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    List<Widget> gridCard = widget.data.map((item) {
      return Item(
        image: item,
        onHideItem: () {
          //hideItem(item.id);
          // setState(() {
          //   gridCard = [];
          // });
        },
      );
    }).toList();
    return Expanded(
      child: GridView.builder(
        itemCount: gridCard.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const SizedBox(height: 50, width: 50);
          } else {
            return gridCard[index - 1];
          }
        },
      ),
    );
  }
}
