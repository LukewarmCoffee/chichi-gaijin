import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:flutter/foundation.dart';
//internal
import 'package:chichi_gaijin_two/models/lesson.dart';

//The home page list of lessons the user will see
//lessons are added to the agenda from the HiddenLessons provider
//Alternatively machine created reviews are added
//an algorithm determines what to add based on user input
//more specifically, how long they take to finish lessons and
//how well they perform on reviews
class Agenda with ChangeNotifier {
  List<Lesson> _lessons = [
    Lesson(
      title: 'Example Title',
      cards: [
        TitleCard(title: 'Example Card'),
        VocabCard(
            word: Word(
              japanese: 'japanese',
              kana: 'kana',
              romaji: 'romaji',
              english: 'english',
              definition: 'definition',
              confidence: 1.0,
              learned: true,
            ),
            hidden: false),
        VocabCard(
            word: Word(
              japanese: 'japanese 2',
              kana: 'kana 2',
              romaji: 'romaji 2',
              english: 'english 2',
              definition: 'definition 2',
              confidence: 1.0,
              learned: true,
            ),
            hidden: true),
      ],
      type: LessonTypes.authorLesson,
    ),
  ];

  List<Lesson> get lessons {
    return _lessons;
  }

  add(Lesson lesson){
    _lessons.add(lesson);
    notifyListeners();
  }
}
