import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/providers/words.dart';
import 'package:flutter/cupertino.dart';

class Lessoner with ChangeNotifier {
  Words _words;

  final List<Lesson> _lessons = [];

  Words get words => _words;

  set words(Words words){
    assert(words != null);

    _words = words;

    notifyListeners();
  }

  List<Lesson> get lessons => _lessons;


}