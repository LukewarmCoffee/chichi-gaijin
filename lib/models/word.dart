import 'package:flutter/foundation.dart';
//can contain multiple kanji
//word != lexeme
//as in, each word only represents a single definition and not all of its constiuents
class Word{
  //most common reading for this word; kanji included
  final String japanese;
  //no kanji
  final String kana;
  //kana in english
  final String romaji;
  //the smallest possible translation for this word
  //do not include multiple definitions here
  final String english;
  //if this kanji has multiple uses, only explain the one you are using in the english category
  final String definition;
  //how well the user knows this word, starts at 0
  final double confidence;

  const Word({
    @required this.japanese,
    @required this.kana,
    @required this.romaji,
    @required this.english,
    @required this.definition,
    @required this.confidence,
  });

}