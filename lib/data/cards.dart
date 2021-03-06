import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
//internal
import '../models/models.dart';

//every single content card out there, lessons will pull from this list
class Cards extends ChangeNotifier {
  static const String _boxName = 'cardsBox';

  List<ContentCard> _cards = [];

  HiveList<Word> _words;

  HiveList<Word> get words => _words;

  set words(HiveList<Word> words) {
    assert(words != null);
    _words = words;
    notifyListeners();
  }

  Future<HiveList<ContentCard>> get hiveList async {
    var box = await Hive.openBox<ContentCard>(_boxName);
    HiveList<ContentCard> hiveList = HiveList(box)..addAll(box.values.toList());
    return hiveList;
  }

  List<ContentCard> get cards {
    getCards();
    return _cards;
  }

  void getCards() async {
    var box = await Hive.openBox<ContentCard>(_boxName);

    _cards = box.values.toList();

    notifyListeners();
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

  void editCard({@required ContentCard card, @required int cardKey}) async {
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

  //TODO: delte this
  init() async {
    /*addCard(
      TitleCard(false, title: 'title', subtitle: 'subtitle'),
    );
    addCard(
      ReviewCard(false, word: _words),
    );*/
    addCard(
      SentenceReviewCard(false, words: _words, translation: 'translation'),
    );
  }
}
