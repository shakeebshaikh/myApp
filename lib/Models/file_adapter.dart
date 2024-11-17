import 'dart:io';
import 'package:hive/hive.dart';

class FileAdapter extends TypeAdapter<File> {
  @override
  final int typeId = 1; // Unique type ID for File

  @override
  File read(BinaryReader reader) {
    final path = reader.readString(); // Reading the path of the file
    return File(path); // Returning the File object
  }

  @override
  void write(BinaryWriter writer, File obj) {
    writer.writeString(obj.path); // Writing only the file path
  }
}
