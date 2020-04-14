import 'package:flutter/foundation.dart';

import '../models/models.dart';

class CreateLesson with ChangeNotifier{
  String _title = '';
  
  List<ContentCard> _cards = [];

  bool _hidden = true;

  String get title =>  _title;

  List<ContentCard> get cards => _cards;

  bool get hidden => _hidden;
  
}