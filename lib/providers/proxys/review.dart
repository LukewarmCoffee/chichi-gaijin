import 'package:chichi_gaijin_two/providers/main/agenda.dart';
import 'package:chichi_gaijin_two/providers/main/deck.dart';
import 'package:chichi_gaijin_two/providers/main/hidden_lessons.dart';
import 'package:flutter/foundation.dart';
//whenever a user makes a decision in a reviewable card, they are sent here
//that decision then bubbles thru the relevant word in deck, agenda and hiddenlessons
class Review{
  final Deck deck;
  final Agenda agenda;
  final HiddenLessons hiddenLessons;

  const Review({
    @required this.deck,
    @required this.agenda,
    @required this.hiddenLessons,
  });
}