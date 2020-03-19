import 'package:chichi_gaijin_two/models/word.dart';
import 'package:hive/hive.dart';

part 'pontent.g.dart';

class Pontent {
  String id;
  bool hidden;
}

@HiveType(typeId: 20)
class Pontenter extends Pontent {
  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final bool hidden;
  @HiveField(2)
  final String extra;

  Pontenter(this.id, this.hidden, this.extra);
}

@HiveType(typeId: 21)
class Pontented extends Pontent {
  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final bool hidden;
  @HiveField(2)
  final String title;
  @HiveField(3)
  HiveList<Word> word; 

  Pontented(this.id, this.hidden, this.title, this.word);

}
