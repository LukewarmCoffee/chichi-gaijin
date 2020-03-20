// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TitleCardAdapter extends TypeAdapter<TitleCard> {
  @override
  final typeId = 50;

  @override
  TitleCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TitleCard(
      fields[0] as bool,
      title: fields[2] as String,
      subtitle: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TitleCard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hidden)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.subtitle);
  }
}

class BodyCardAdapter extends TypeAdapter<BodyCard> {
  @override
  final typeId = 51;

  @override
  BodyCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BodyCard(
      fields[0] as bool,
      body: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BodyCard obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hidden)
      ..writeByte(1)
      ..write(obj.body);
  }
}

class VocabCardAdapter extends TypeAdapter<VocabCard> {
  @override
  final typeId = 52;

  @override
  VocabCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VocabCard(
      fields[0] as bool,
      word: (fields[1] as HiveList)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, VocabCard obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hidden)
      ..writeByte(1)
      ..write(obj.word);
  }
}

class ReviewCardAdapter extends TypeAdapter<ReviewCard> {
  @override
  final typeId = 53;

  @override
  ReviewCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewCard(
      fields[0] as bool,
      word: (fields[1] as HiveList)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, ReviewCard obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hidden)
      ..writeByte(1)
      ..write(obj.word);
  }
}

class SentenceReviewCardAdapter extends TypeAdapter<SentenceReviewCard> {
  @override
  final typeId = 54;

  @override
  SentenceReviewCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SentenceReviewCard(
      fields[0] as bool,
      words: (fields[1] as HiveList)?.castHiveList(),
      translation: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SentenceReviewCard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hidden)
      ..writeByte(1)
      ..write(obj.words)
      ..writeByte(2)
      ..write(obj.translation);
  }
}
