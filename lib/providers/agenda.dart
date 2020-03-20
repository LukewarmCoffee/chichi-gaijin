import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:chichi_gaijin_two/widgets/content_card_widgets/content_card_widgets.dart';

import 'deck.dart';

//This is actually a service, however  I will be treating it like the actual data
//source for Lessons
/*class Agenda {
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
          BodyCard(body: 'An example body. The next card will be a new vocab'),
          VocabCard(wordId: _deck.deck[0].id, hidden: false),
          VocabCard(wordId: _deck.deck[1].id, hidden: false),
          EnglishReview(
            wordId: _deck.deck[0].id,
          ),
          EnglishSentenceReview(
            wordIds: [_deck.deck[1].id, _deck.deck[1].id, _deck.deck[0].id],
            hidden: false,
            translation: 'a natty translation',
          ),
        ],
        type: LessonTypes.authorLesson,
      ),
    );
  }

  //remove a reviewable type and add it to the deck if it's marked for deck
  removeReviewable({int lessonIndex, int cardIndex}) {
    _lessons.removeCard(lessonIndex: lessonIndex, cardIndex: cardIndex);
  }

  Word getWord(String id) {
    return _deck.deck.firstWhere((word) => word.id == id);
  }

  List<Word> getWords(List<String> wordIds) {
    List<Word> words = [];
    for (int i = 0; i < wordIds.length; i++) words.add(getWord(wordIds[i]));
    return words;
  }

  List<Lesson> get lessons {
    return _lessons.lessons;
  }

  add(Lesson lesson) {
    _lessons.add(lesson);
  }
}*/
