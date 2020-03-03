import 'package:chichi_gaijin_two/models/word.dart';
import 'package:flutter/foundation.dart';
//Contains all the types of cards a user might see
//The meat and potatoes of this app
abstract class ContentCards {}
//Displays a centered title with an optional subtitle
class TitleCard implements ContentCards {
  final String title;
  final String subtitle;

  const TitleCard({
    @required this.title,
    this.subtitle,
  });
}
//Special card; adds this card to deck upon finishing a lesson
class VocabCard implements ContentCards {
  //the word to be added
  final Word word;
  //whether the user can see this card during the lesson
  final bool hidden;

  const VocabCard({
    @required this.word,
    @required this.hidden,
  });
}

//Special card; user decides whether they understand the card or not
//displays a word, in japanese, user asked for word in english
class EnglishReview implements ContentCards {
  final Word word;

  const EnglishReview ({
    @required this.word,
  });
}
 