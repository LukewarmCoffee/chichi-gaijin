import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/word.dart';

part 'content_card.g.dart';

class ContentCard extends HiveObject {
  bool hidden;
}

@HiveType(typeId: 50)
class TitleCard extends ContentCard {
  @override
  @HiveField(0)
  final bool hidden;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String subtitle;

  TitleCard(
    this.hidden, {
    @required this.title,
    this.subtitle,
  });
}

@HiveType(typeId: 51)
class BodyCard extends ContentCard {
  @override
  @HiveField(0)
  final bool hidden;
  @HiveField(1)
  final String body;

  BodyCard(
    this.hidden, {
    @required this.body,
  });
}

//Special card; adds this card to deck upon finishing a lesson
@HiveType(typeId: 52)
class VocabCard extends ContentCard {
  @override
  @HiveField(0)
  final bool hidden;
  //the word to be learned
  @HiveField(1)
  final HiveList<Word> word;

  VocabCard(
    this.hidden, {
    @required this.word,
  });
}

//Special card; user decides whether they understand the card or not
//displays a word, in japanese, user asked for word in english
@HiveType(typeId: 53)
class ReviewCard extends ContentCard {
  @override
  @HiveField(0)
  final bool hidden;
  //the word to be reviewed
  @HiveField(1)
  final HiveList<Word> word;

  ReviewCard(
    this.hidden, {
    @required this.word,
  });
}

//user decides if they understand the translation in english or not,
@HiveType(typeId: 54)
class SentenceReviewCard extends ContentCard {
  @override
  @HiveField(0)
  final bool hidden;
  //ids of all the words in the sentence
  @HiveField(1)
  final HiveList<Word> words;
  //an optional natural translation for the sentence
  @HiveField(2)
  final String translation;

  SentenceReviewCard(
    this.hidden, {
    @required this.words,
    this.translation,
  });
}
