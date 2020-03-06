import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:flutter/cupertino.dart';

class Deck with ChangeNotifier {
  //all the Words the user has learned
  List<Word> _deck = [
    Word(
      japanese: 'japanese',
      kana: 'kana',
      romaji: 'romaji',
      english: 'english',
      definition: 'definition',
      confidence: 1.0,
      learned: false,
    ),
    Word(
      japanese: 'japanese 2',
      kana: 'kana 2',
      romaji: 'romaji 2',
      english: 'english 2',
      definition: 'definition 2',
      confidence: 1.0,
      learned: false,
    ),
  ];
  //single list per content type ideally
  List<ContentCards> _extraReviews = [];

  List<Word> get deck {
    return _deck;
  }

  List<ContentCards> get extraReviews {
    return _extraReviews;
  }

  add(Word word) {
    _deck.add(word);
    notifyListeners();
  }

  changeConfidence({@required Word word, @required double confidence}) {
    int index = deck.indexWhere((oldWord) => oldWord.id == word.id);

    deck.replaceRange(
      index,
      index + 1,
      [
        Word(
          japanese: word.japanese,
          kana: word.kana,
          romaji: word.romaji,
          english: word.english,
          definition: word.definition,
          confidence: (word.confidence + confidence),
          learned: word.learned,
          id: word.id,
        ),
      ],
    );

    notifyListeners();
  }
}
