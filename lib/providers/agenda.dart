import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/models/word.dart';

import 'deck.dart';
import 'lessons.dart';
//This is actually a service, however  I will be treating it like the actual data
//source for Lessons
class Agenda{
  final Deck _deck;
  final Lessons _lessons;  

  const Agenda(
    this._deck,
    this._lessons,
  );

  //dummy data
  initData() {
    _lessons.add(
      Lesson(
        title: 'Example 2 Title',
        cards: [
          TitleCard(title: 'Example Card'),
          VocabCard(wordId: _deck.deck[0].id, hidden: false),
          VocabCard(wordId: _deck.deck[1].id, hidden: true),
          EnglishReview(wordId: _deck.deck[0].id,),
        ],
        type: LessonTypes.authorLesson,
      ),
    );
  }

  Word getWord(String id){
    return _deck.deck.firstWhere((word) => word.id == id);
  }

  List<Lesson> get lessons {
    return _lessons.lessons;
  }

  add(Lesson lesson) {
    _lessons.add(lesson);
  }
}
