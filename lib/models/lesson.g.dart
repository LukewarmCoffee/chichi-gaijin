// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonAdapter extends TypeAdapter<Lesson> {
  @override
  final typeId = 10;

  @override
  Lesson read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lesson(
      title: fields[0] as String,
      cards: (fields[1] as HiveList)?.castHiveList(),
      type: fields[2] as LessonTypes,
      finished: fields[3] as bool,
      hidden: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Lesson obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.cards)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.finished)
      ..writeByte(4)
      ..write(obj.hidden);
  }
}
