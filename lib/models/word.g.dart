// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<Word> {
  @override
  final typeId = 0;

  @override
  Word read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word(
      japanese: fields[0] as String,
      kana: fields[1] as String,
      romaji: fields[2] as String,
      english: fields[3] as String,
      definition: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.japanese)
      ..writeByte(1)
      ..write(obj.kana)
      ..writeByte(2)
      ..write(obj.romaji)
      ..writeByte(3)
      ..write(obj.english)
      ..writeByte(4)
      ..write(obj.definition)
      ..writeByte(5)
      ..write(obj.confidence)
      ..writeByte(6)
      ..write(obj.learned)
      ..writeByte(7)
      ..write(obj.id);
  }
}
