import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:chichi_gaijin_two/providers/hidden_lessons.dart';
import 'package:flutter/foundation.dart';

import 'deck.dart';
import 'lessons.dart';
//The Lessons the user has access to
class Agenda {
  final List<Word> deck;
  final List<Lessons> lessons;  
  final HiddenLessons hiddenLessons;

  const Agenda({
    @required this.deck,
    @required this.lessons,
    @required this.hiddenLessons,
  });

  //dummy data
  initData() {
    lessons.add(
      Lesson(
        title: 'Example 2 Title',
        cards: [
          TitleCard(title: 'Example Card'),
          VocabCard(word: deck[0], hidden: false),
          VocabCard(word: deck[1], hidden: true),
          EnglishReview(word: deck[0],),
        ],
        type: LessonTypes.authorLesson,
      ),
    );
  }

  List<Lesson> get lessons {
    return lessonsProv.lessons;
  }

  add(Lesson lesson) {
    lessonsProv.add(lesson);
  }
}
