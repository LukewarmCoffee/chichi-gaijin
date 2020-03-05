import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:flutter/foundation.dart';

class Agenda with ChangeNotifier {
  final List<Word> deck;

  Agenda({
    @required this.deck,
  });

  List<Lesson> _lessons = [];

  initData() {
    _lessons.add(
      Lesson(
        title: 'Example 2 Title',
        cards: [
          TitleCard(title: 'Example Card'),
          VocabCard(word: deck[0], hidden: false),
          VocabCard(word: deck[1], hidden: true),
        ],
        type: LessonTypes.authorLesson,
      ),
    );
    notifyListeners();
  }

  List<Lesson> get lessons {
    return _lessons;
  }

  add(Lesson lesson) {
    _lessons.add(lesson);
    notifyListeners();
  }
}
