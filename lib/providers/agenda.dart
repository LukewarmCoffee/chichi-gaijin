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
  final Deck _deck;
  final Lessons _lessons;  
  final HiddenLessons _hiddenLessons;

  const Agenda(
    this._deck,
    this._lessons,
    this._hiddenLessons,
  );

  //dummy data
  initData() {
    _lessons.add(
      Lesson(
        title: 'Example 2 Title',
        cards: [
          TitleCard(title: 'Example Card'),
          VocabCard(word: _deck.deck[0], hidden: false),
          VocabCard(word: _deck.deck[1], hidden: true),
          EnglishReview(word: _deck.deck[0],),
        ],
        type: LessonTypes.authorLesson,
      ),
    );
  }



  

  List<Lesson> get lessons {
    return _lessons.lessons;
  }

  add(Lesson lesson) {
    _lessons.add(lesson);
  }
}
