//external imports
import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
//internal imports
import './lesson_types.dart';

part 'lesson.g.dart';

@HiveType(typeId: 10)
class Lesson {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final HiveList<ContentCard> cards;
  //enum
  @HiveField(2)
  final LessonTypes type;
  //sets to true when user completes the lesson
  @HiveField(3)
  final bool finished;
  @HiveField(4)
  final bool hidden;

  const Lesson({
    @required this.title,
    @required this.cards,
    @required this.type,
    @required this.finished,
    @required this.hidden,
  });
}
