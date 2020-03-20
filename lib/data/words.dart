import 'package:chichi_gaijin_two/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Words extends ChangeNotifier {
  String _boxName = 'wordsBox';

  List<Word> _words = [];

  void getWords() async {
    var box = await Hive.openBox<Word>(_boxName);

    _words = box.values.toList();

    notifyListeners();
  }
  
  List<Word> get words {
    getWords();
    return _words;
  }

  /*Future<List<Word>> get words async {
    var box = await Hive.openBox<Word>(_boxName);

    _words = box.values.toList();

    notifyListeners();

    return _words;
  }*/

  Future<HiveList<Word>> get hiveList async {
    var box = await Hive.openBox<Word>(_boxName);
    HiveList<Word> list = HiveList(box)..addAll(box.values.toList());
    return list;
  }

  Word getWord(index) {
    return _words[index];
  }

  int get wordCount {
    return _words.length;
  }

  void addWord(Word word) async {
    var box = await Hive.openBox<Word>(_boxName);

    await box.add(word);

    _words = box.values.toList();

    notifyListeners();
  }

  void editWord({@required Word word, @required int wordKey}) async {
    var box = await Hive.openBox<Word>(_boxName);

    await box.put(wordKey, word);

    _words = box.values.toList();

    notifyListeners();
  }

  void deleteAll() async {
    var box = await Hive.openBox<Word>(_boxName);

    var keys = box.keys.toList();

    await box.deleteAll(keys);

    _words = box.values.toList();

    notifyListeners();
  }

  //TODO: delte this
  init() {
    addWord(
      Word(
        japanese: 'japanese',
        kana: 'kana',
        romaji: 'romaji',
        english: 'english',
        definition: 'definition',
        confidence: 1.0,
        learned: false,
      ),
    );
    addWord(
      Word(
        japanese: 'japanese2',
        kana: 'kana',
        romaji: 'romaji',
        english: 'english',
        definition: 'definition2',
        confidence: 1.0,
        learned: false,
      ),
    );
  }
}
