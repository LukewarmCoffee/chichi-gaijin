import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:flutter/cupertino.dart';

class HiddenLessons with ChangeNotifier {
  //Lessons to be eventually added to the Agenda
  List<Lesson> _lessons = [
    Lesson(
      title: 'Example Title',
      cards: [TitleCard(title: 'Example Card')],
      type: LessonTypes.authorLesson,
    ),
  ];

  List<Lesson> get lessons {
    return _lessons;
  }

}
