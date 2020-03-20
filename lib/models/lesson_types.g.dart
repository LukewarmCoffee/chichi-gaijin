// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_types.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonTypesAdapter extends TypeAdapter<LessonTypes> {
  @override
  final typeId = 100;

  @override
  LessonTypes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LessonTypes.authorLesson;
      case 1:
        return LessonTypes.userReview;
      case 2:
        return LessonTypes.userLesson;
      case 3:
        return LessonTypes.machineReview;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, LessonTypes obj) {
    switch (obj) {
      case LessonTypes.authorLesson:
        writer.writeByte(0);
        break;
      case LessonTypes.userReview:
        writer.writeByte(1);
        break;
      case LessonTypes.userLesson:
        writer.writeByte(2);
        break;
      case LessonTypes.machineReview:
        writer.writeByte(3);
        break;
    }
  }
}
