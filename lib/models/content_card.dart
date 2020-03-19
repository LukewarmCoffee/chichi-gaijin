import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'content_card.g.dart';


//Contains all the types of cards a user might see
//The meat and potatoes of this app
@HiveType(typeId: 15)
class ContentCard extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final bool hidden;

  ContentCard({
  bool hidden = false,
    String id,
  })  : this.hidden = hidden ?? false,
        this.id = id ?? Uuid().v4();
}

//Displays a centered title with an optional subtitle
@HiveType(typeId: 16)
class TitleCards extends ContentCard {
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String subtitle;

  TitleCards({
    @required this.title,
    this.subtitle,});
    
}

//typically used for making a paragraph of text
@HiveType(typeId: 17)
class BodyCards extends ContentCard {
  @HiveField(5)
  final String body;

  BodyCards({
    @required this.body,
  });
}


//Special card; adds this card to deck upon finishing a lesson
/*8class VocabCard implements ContentCard {
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
}*/
