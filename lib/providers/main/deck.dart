import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:flutter/cupertino.dart';

class Deck with ChangeNotifier{
  //all the Words the user has learned
  List<Word> _deck = [];
  //single list per content type ideally
  List<ContentCards> _extraReviews = [];

  List<Word> get deck{
    return _deck;
  }

  List<ContentCards> get extraReviews{
    return _extraReviews;
  }

}