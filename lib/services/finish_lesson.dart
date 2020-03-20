//upon finishing a lesson, moves any special contentcards into the deck
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:flutter/foundation.dart';

/*class FinishLesson {
  final Agenda agenda;
  final Deck _deck;
  final HiddenLessons hiddenLessons;

  const FinishLesson(
    this.agenda,
    this._deck,
    this.hiddenLessons,
  );
  //adds any review type cards or words to the deck
  //decides what type of lesson to add to the agenda next
  endLesson({@required int lessonIndex}) async {
    Lesson oldLesson = agenda.lessons[lessonIndex];

    addCardsToDeck(oldLesson).whenComplete(addLesson());
  }

  //makes appropriate alterations to the deck
  Future addCardsToDeck(Lesson oldLesson) async {
    if (oldLesson.type == LessonTypes.authorLesson ||
        oldLesson.type == LessonTypes.userLesson)
      for (int i = 0; i < oldLesson.cards.length; i++) {
        final card = oldLesson.cards[i];
        if (card is VocabCard)
          //lets the deck know that the user knows the word (for reviews)
          _deck.learn(card.wordId);
        else if (card is EnglishSentenceReview)
          //adds a new reviewable sentence to the _sentences portion of deck
          _deck.addSentence(ids: card.wordIds, translation: card.translation);
      }
  }

  //decides what kind of lesson to add to the agenda
  addLesson() async {
    double avgConfidence = 0.0;
    List<Word> deck = _deck.deck;
    //sorts by confidence (double)
    deck.sort((a, b) => (b.confidence).compareTo(a.confidence));

    List<Word> sublist = [];
    if (deck.length < 10)
      sublist = deck.sublist(0, deck.length);
    else
      sublist = deck.sublist(0, 10);
    //average confidence computation
    for (int i = 0; i < sublist.length; i++)
      avgConfidence += sublist[i].confidence;
    avgConfidence /= sublist.length;

    //adds the appropriate lesson to agenda
    if (avgConfidence < 1.0 && sublist.length >= 10) {
      agenda.add(
        Lesson(
          title: 'Review',
          cards: [
            for (int i = 0; i < sublist.length; i++)
              EnglishReview(wordId: sublist[i].id),
          ],
          type: LessonTypes.machineReview,
        ),
      );
    } else {
      final lesson = hiddenLessons.pop();
      if (lesson != null) agenda.add(lesson);
    }
    //returns the first lesson from hiddenLessons and adds it to agenda
  }
}*/
