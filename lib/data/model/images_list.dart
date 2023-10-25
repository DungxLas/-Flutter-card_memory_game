import 'dart:math';

import 'package:card_memory_game/data/model/image_q.dart';

class ImagesList {
  List<ImageQ> list;

  ImagesList({required this.list});

  ImagesList createQuiz() {
    ImagesList quiz = ImagesList(list: [...list, ...list]);
    quiz.list.shuffle(Random());
    return quiz;
  }
}
