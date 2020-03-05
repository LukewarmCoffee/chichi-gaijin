//upon finishing a lesson, moves any special contentcards into the deck
import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:flutter/foundation.dart';

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
    final lesson = hiddenLessons.pop();


    if(lesson != null)
      agenda.add(lesson);

  }


}