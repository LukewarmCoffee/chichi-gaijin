//external imports
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
//internal imports
import './lesson_types.dart';

//used for testing various things
@immutable
class Lesson2 {
  final String title;
  final List<String> cardsIds;
  //enum
  final LessonTypes type;
  //sets to true when user completes the lesson
  final bool finished;
  final String id;

  Lesson2({
    @required this.title,
    @required this.cardsIds,
    @required this.type,
    bool finished = false,
    String id,
  })  : this.finished = finished ?? false,
        this.id = id ?? Uuid().v4();
}
