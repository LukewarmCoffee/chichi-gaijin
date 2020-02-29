//external imports
import 'package:flutter/foundation.dart';
//internal imports
import './content_cards.dart';
import './lesson_types.dart';

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

