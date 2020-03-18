import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:chichi_gaijin_two/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Cards extends ChangeNotifier {
  String _boxName = 'cardsBox';

  List<ContentCard> _cards = [];

  void getCards() async {
    var box = await Hive.openBox<ContentCard>(_boxName);

    _cards = box.values.toList();

    notifyListeners();
  }

  List<ContentCard> get cards {
    getCards();
    return _cards;
  }

  //TODO: delte this
  init() {
    addCard(
      TitleCards(title: 'Example Card'),
    );
    addCard(
      BodyCards(body: 'An example body. The next card will be a new vocab'),
    );
  }

  ContentCard getCard(index) {
    return _cards[index];
  }

  int get wordCount {
    return _cards.length;
  }

  void addCard(ContentCard card) async {
    var box = await Hive.openBox<ContentCard>(_boxName);

    await box.add(card);

    _cards = box.values.toList();

    notifyListeners();
  }

  void editWord({@required ContentCard card, @required int cardKey}) async {
    var box = await Hive.openBox<ContentCard>(_boxName);

    await box.put(cardKey, card);

    _cards = box.values.toList();

    notifyListeners();
  }

  void deleteAll() async {
    var box = await Hive.openBox<ContentCard>(_boxName);

    var keys = box.keys.toList();

    await box.deleteAll(keys);

    _cards = box.values.toList();

    notifyListeners();
  }
}
