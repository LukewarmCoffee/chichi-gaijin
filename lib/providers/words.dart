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

  Word getWord(index){
    return _words[index];
  }

  int get wordCount {
    return _words.length;
  }

  void addWord(Word word) async {
    var box = await Hive.openBox<Word>(_boxName);

    await box.add(word);

    _words = box.values.toList();
  }

  void editWord({@required Word word, @required int wordKey}) async {
    var box = await Hive.openBox<Word>(_boxName);

    await box.put(wordKey, word);

    _words = box.values.toList();

    notifyListeners();
  }

  
}