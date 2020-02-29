import 'package:flutter/foundation.dart';
//internal
import 'package:chichi_gaijin_two/models/lesson.dart';
//The home page list of lessons the user will see
//lessons are added to the agenda from the HiddenLessons provider
//Alternatively Machine created reviews are added
//an algorithm determines what to add based on user input
//more specifically, how long they take to finish lessons and
//how well they perform on reviews
class Agenda with ChangeNotifier{  
  List<Lesson> _agenda = [];

  List<Lesson> get agenda {
    return _agenda;
  }

}