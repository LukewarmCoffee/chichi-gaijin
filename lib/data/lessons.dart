import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:chichi_gaijin_two/models/lesson.dart';
import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class Lessons with ChangeNotifier {
  static const String _boxName = 'lessonsBox';

  List<Lesson> _lessons = [];

  HiveList<ContentCard> _cards;

  HiveList<ContentCard> get cards => _cards;

  set cards(HiveList<ContentCard> cards) {
    assert(cards != null);
    _cards = cards;
    notifyListeners();
  }

  void getLessons() async {
    var box = await Hive.openBox<Lesson>(_boxName);

    _lessons = box.values.toList();

    notifyListeners();
  }

  List<Lesson> get lessons {
    getLessons();
    return _lessons;
  }

  int get lessonCount {
    return _lessons.length;
  }

  void addLesson(Lesson lesson) async {
    var box = await Hive.openBox<Lesson>(_boxName);

    await box.add(lesson);

    _lessons = box.values.toList();

    notifyListeners();
  }

  void editLesson({@required Lesson lesson, @required int lessonKey}) async {
    var box = await Hive.openBox<Lesson>(_boxName);

    await box.put(lessonKey, lesson);

    _lessons = box.values.toList();

    notifyListeners();
  }

  void deleteAll() async {
    var box = await Hive.openBox<Lesson>(_boxName);

    var keys = box.keys.toList();

    await box.deleteAll(keys);

    _lessons = box.values.toList();

    notifyListeners();
  }

  //TODO: delte this
  init() async {
    addLesson(
      Lesson(
        title: 'title',
        hidden: false,
        type: LessonTypes.authorLesson,
        cards: _cards,
        finished: false,
      ),
    );
  }
}
