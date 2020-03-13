import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'word.g.dart';

//can contain multiple kanji
//word != lexeme
//as in, each word only represents a single definition and not all of its constiuents
@HiveType(typeId: 0)
class Word extends HiveObject{
  //most common reading for this word; kanji included
  @HiveField(0)
  final String japanese;
  //no kanji
  @HiveField(1)
  final String kana;
  //kana in english
  @HiveField(2)
  final String romaji;
  //the smallest possible translation for this word
  //do not include multiple definitions here
  @HiveField(3)
  final String english;
  //if this kanji has multiple uses, only explain the one you are using in the english category
  @HiveField(4)
  final String definition;
  //how well the user knows this word, starts at 0
  @HiveField(5)
  final double confidence;
  //if the user has learned this word
  @HiveField(6)
  final bool learned;
  //UUid
  @HiveField(7)
  final String id;

  Word({
    @required this.japanese,
    @required this.kana,
    @required this.romaji,
    @required this.english,
    @required this.definition,
    double confidence = 0.0,
    bool learned = false,
    String id,
  })  : this.confidence = confidence ?? 0.0,
        this.learned = learned ?? false,
        this.id = id ?? Uuid().v4();
}

