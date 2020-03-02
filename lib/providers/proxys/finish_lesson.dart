//upon finishing a lesson, moves any special contentcards into the deck
import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/providers/main/agenda.dart';
import 'package:chichi_gaijin_two/providers/main/deck.dart';
import 'package:chichi_gaijin_two/providers/main/hidden_lessons.dart';
import 'package:flutter/cupertino.dart';

class FinishLesson{
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
  endLesson({@required int lessonIndex}){
    final cards = agenda.lessons[lessonIndex].cards;

    for(int i = 0; i < cards.length; i++){
      final card = cards[i];
      if(card is VocabCard)
        deck.add(card.word);
    }

    final lesson = hiddenLessons.pop();


    if(lesson != null)
      agenda.add(lesson);

  }


}