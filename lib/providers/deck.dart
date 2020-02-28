import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:flutter/cupertino.dart';

class Deck with ChangeNotifier{
  List<Word> _deck = [];
  //single list per content type ideally
  List<ContentCards> _extraReviews = [];

}