// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContentCardAdapter extends TypeAdapter<ContentCard> {
  @override
  final typeId = 1;

  @override
  ContentCard read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    //return ContentCard();
  }

  @override
  void write(BinaryWriter writer, ContentCard obj) {
    writer..writeByte(0);
  }
}

class TitleCardsAdapter extends TypeAdapter<TitleCards> {
  @override
  final typeId = 2;

  @override
  TitleCards read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TitleCards(
      title: fields[0] as String,
      subtitle: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TitleCards obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.hidden);
  }
}

class BodyCardsAdapter extends TypeAdapter<BodyCards> {
  @override
  final typeId = 3;

  @override
  BodyCards read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BodyCards(
      body: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BodyCards obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.body)
      ..writeByte(1)
      ..write(obj.hidden)
      ..writeByte(2)
      ..write(obj.id);
  }
}
