// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContentCardAdapter extends TypeAdapter<ContentCard> {
  @override
  final typeId = 15;

  @override
  ContentCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContentCard();
  }

  @override
  void write(BinaryWriter writer, ContentCard obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hidden);
  }
}

class TitleCardsAdapter extends TypeAdapter<TitleCards> {
  @override
  final typeId = 16;

  @override
  TitleCards read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TitleCards(
      title: fields[3] as String,
      subtitle: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TitleCards obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.subtitle)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hidden);
  }
}

class BodyCardsAdapter extends TypeAdapter<BodyCards> {
  @override
  final typeId = 17;

  @override
  BodyCards read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BodyCards(
      body: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BodyCards obj) {
    writer
      ..writeByte(3)
      ..writeByte(5)
      ..write(obj.body)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hidden);
  }
}
