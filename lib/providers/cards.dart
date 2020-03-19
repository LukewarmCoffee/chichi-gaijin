import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:chichi_gaijin_two/models/models.dart';
import 'package:chichi_gaijin_two/models/pontent.dart';
import 'package:chichi_gaijin_two/providers/words.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Cards extends ChangeNotifier {
  String _boxName = 'nards';

  Words _words;

  Words get words => _words;

  set words(Words words) {
    assert(words != null);
    _words = words;
    notifyListeners();
  }

  List<Pontent> _cards = [];

  void getCards() async {
    var box = await Hive.openBox<Pontent>(_boxName);

    _cards = box.values.toList();

    notifyListeners();
  }

  List<Pontent> get cards {
    getCards();
    return _cards;
  }

  //TODO: delte this
  init() async {
    HiveList<Word> lst;
    await words.list.then((dddd) => lst = dddd);
    print(lst);

    _words.addWord(Word(
      japanese: 'japanese',
      kana: 'kana',
      romaji: 'romaji',
      english: 'english',
      definition: 'definition',
      confidence: 1.0,
      learned: false,
    ));
    addCard(
      Pontenter('1', false, 'heyo'),
    );
    addCard(
      Pontented('1', false, 'heye', lst),
    );
  }

  Pontent getCard(index) {
    return _cards[index];
  }

  int get wordCount {
    return _cards.length;
  }

  void addCard(Pontent card) async {
    var box = await Hive.openBox<Pontent>(_boxName);

    await box.add(card);

    _cards = box.values.toList();

    notifyListeners();
  }

  void editWord({@required Pontent card, @required int cardKey}) async {
    var box = await Hive.openBox<Pontent>(_boxName);

    await box.put(cardKey, card);

    _cards = box.values.toList();

    notifyListeners();
  }

  void deleteAll() async {
    var box = await Hive.openBox<Pontent>(_boxName);

    var keys = box.keys.toList();

    await box.deleteAll(keys);

    _cards = box.values.toList();

    notifyListeners();
  }
}
