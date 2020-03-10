import 'package:flutter/cupertino.dart';
//clicking on one of the items in the sentence makes that item true
//checks for unique strings
class DepressableSentence with ChangeNotifier{
  List<String> _sentence = [];
  List<bool> _depressions = [];

  List<bool> get depressions{
    return _depressions;
  }
  //returns the unique indexes of all depressed words
  List<String> get depressedSubList{
    List<String> subList = [];
    for(int i = 0; i < _sentence.length; i++){
      if(_depressions[i] && !subList.contains(_sentence[i]))
        subList.add(_sentence[i]);
    }

    return subList;

  }

  setSentence(List<String> words){
    for(int i = 0; i < words.length; i++){
      _sentence.add(words[i]);
      _depressions.add(false);
    }
    notifyListeners();
  }

  depress(int index){
    String word = _sentence[index];
    for(int i = 0; i < _sentence.length; i++)
      if(word == _sentence[i])
        _depressions.replaceRange(i, i+1, [true]);
    notifyListeners();
  }

  unDepress(int index){
    String word = _sentence[index];
    for(int i = 0; i < _sentence.length; i++)
      if(word == _sentence[i])
        _depressions.replaceRange(i, i+1, [false]);
    notifyListeners();
  }
}