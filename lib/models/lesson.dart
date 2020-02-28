import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Lesson {
  final String title;
  final List<ContentCards> cards;
  //enum
  final LessonTypes type;

  const Lesson({
    @required this.title,
    @required this.cards,
    @required this.type,
  });
}

