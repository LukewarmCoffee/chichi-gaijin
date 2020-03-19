// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pontent.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PontenterAdapter extends TypeAdapter<Pontenter> {
  @override
  final typeId = 20;

  @override
  Pontenter read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pontenter(
      fields[0] as String,
      fields[1] as bool,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Pontenter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hidden)
      ..writeByte(2)
      ..write(obj.extra);
  }
}

class PontentedAdapter extends TypeAdapter<Pontented> {
  @override
  final typeId = 21;

  @override
  Pontented read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pontented(
      fields[0] as String,
      fields[1] as bool,
      fields[2] as String,
      (fields[3] as HiveList)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, Pontented obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hidden)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.word);
  }
}
