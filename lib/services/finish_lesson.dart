//upon finishing a lesson, moves any special contentcards into the deck
import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:flutter/foundation.dart';

class FinishLesson {
  final Agenda agenda;
  final Deck deck;
  final HiddenLessons hiddenLessons;

  const FinishLesson({
    @required this.agenda,
    @required this.deck,
    @required this.hiddenLessons,
  });
  //adds any review type cards or words to the deck
  //decides what type of lesson to add to the agenda next
  endLesson({@required int lessonIndex}) {
    final lesson = hiddenLessons.pop();

    if (lesson != null) agenda.add(lesson);
    //TODO implement this in deck
    /*Lesson oldLesson = agenda.lessons[lessonIndex];
    if (oldLesson.type == LessonTypes.authorLesson ||
        oldLesson.type == LessonTypes.userLesson)
      for (int i = 0; i < oldLesson.cards.length; i++) {
        final card = oldLesson.cards[i];
        if(card is VocabCard)
          deck.unhide(card.wordId);
        else if(card is EnglishSentenceReview)
          deck.addSentence(ids: card.words, translation: card.translation);
      }*/
  }
}
