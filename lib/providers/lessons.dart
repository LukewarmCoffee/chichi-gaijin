
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:flutter/cupertino.dart';

class Lessons with ChangeNotifier{
  List<Lesson> _lessons = [];

   List<Lesson> get lessons {
    return _lessons;
  }

  add(Lesson lesson) {
    _lessons.add(lesson);
    notifyListeners();
  }

}