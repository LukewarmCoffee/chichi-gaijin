import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'content_card.g.dart';


//Contains all the types of cards a user might see
//The meat and potatoes of this app
@HiveType(typeId: 1)
abstract class ContentCard{
  get id;
  get hidden;
}

//Displays a centered title with an optional subtitle
@HiveType(typeId: 2)
class TitleCards extends HiveObject implements ContentCard {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final bool hidden;

  TitleCards({
    @required this.title,
    this.subtitle,
    bool hidden = false,
    String id,
  })  : this.hidden = hidden ?? false,
        this.id = id ?? Uuid().v4();
}

//typically used for making a paragraph of text
@HiveType(typeId: 3)
class BodyCards implements ContentCard {
  @HiveField(0)
  final String body;
  @HiveField(1)
  final bool hidden;
  @HiveField(2)
  final String id;

  BodyCards({
    @required this.body,
    bool hidden = false,
    String id,
  })  : this.hidden = hidden ?? false,
        this.id = id ?? Uuid().v4();
}

//Special card; adds this card to deck upon finishing a lesson
class VocabCard implements ContentCard {
  //the word to be learned
  final String wordId;
  //whether the user can see this card during the lesson
  final bool hidden;
  final String id;

  VocabCard({
    @required this.wordId,
    bool hidden = false,
    String id,
  })  : this.hidden = hidden ?? false,
        this.id = id ?? Uuid().v4();
}

//Special card; user decides whether they understand the card or not
//displays a word, in japanese, user asked for word in english
class EnglishReview implements ContentCard {
  final String wordId;
  final bool hidden;
  final String id;

  EnglishReview({
    @required this.wordId,
    bool hidden = false,
    String id,
  })  : this.hidden = hidden ?? false,
        this.id = id ?? Uuid().v4();
}

//user decides if they understand the translation in english or not,
class EnglishSentenceReview implements ContentCard {
  //ids of all the words in the sentence
  final List<String> wordIds;
  //whether the user can see this during the lesson
  final bool hidden;
  //an optional natural translation for the sentence
  final String translation;
  final String id;

  EnglishSentenceReview({
    @required this.wordIds,
    String translation = '',
    bool hidden = false,
    String id,
  })  : this.hidden = hidden ?? false,
        this.translation = translation ?? '',
        this.id = id ?? Uuid().v4();
}
