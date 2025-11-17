// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      id: fields[0] as String,
      selfLink: fields[1] as String,
      title: fields[2] as String,
      authors: (fields[3] as List).cast<String>(),
      publishedDate: fields[4] as String,
      description: fields[5] as String,
      pageCount: fields[6] as int,
      categories: (fields[7] as List).cast<String>(),
      maturityRating: fields[8] as String,
      smallThumbnail: fields[9] as String,
      thumbnail: fields[10] as String,
      language: fields[11] as String,
      previewLink: fields[12] as String,
      infoLink: fields[13] as String,
      ratingsCount: fields[14] as num,
      averageRating: fields[15] as num,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.selfLink)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.authors)
      ..writeByte(4)
      ..write(obj.publishedDate)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.pageCount)
      ..writeByte(7)
      ..write(obj.categories)
      ..writeByte(8)
      ..write(obj.maturityRating)
      ..writeByte(9)
      ..write(obj.smallThumbnail)
      ..writeByte(10)
      ..write(obj.thumbnail)
      ..writeByte(11)
      ..write(obj.language)
      ..writeByte(12)
      ..write(obj.previewLink)
      ..writeByte(13)
      ..write(obj.infoLink)
      ..writeByte(14)
      ..write(obj.ratingsCount)
      ..writeByte(15)
      ..write(obj.averageRating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
