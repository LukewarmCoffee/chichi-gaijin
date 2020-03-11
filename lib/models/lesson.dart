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
  //sets to true when user completes the lesson
  final bool finished;

  const Lesson({
    @required this.title,
    @required this.cards,
    @required this.type,
    bool finished = false,
  }) : this.finished = finished ?? false;
}

