import 'dart:convert';
import 'dart:io';

class FileService {
  Directory directory = Directory(Directory.current.path + "\\assets\\files");

  /// this method use for initialization...
  Future<void> init() async {
    bool isDirectoryCreated = await directory.exists();
    if (!isDirectoryCreated) {
      await directory.create();
    }
  }

  Future<String> createFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if (isFileCreated) {
      /// this below code will be edited when I set language service
      throw Exception("file_error".tr);
    }
    await file.create();
    return file.path;
  }

  Future<String> writeFile(Note note, String path) async {
    File file = File(path);
    //CRYPTOGRAPHIC CODE => ENICODE
    ///this code will write when I set language service
    await file.writeAsString(jsonEncode(note.toJson()));
    await file.setLastModified(DateTime.parse(note.time));
    return file.path;
  }

  Future<Note> readFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if (!isFileCreated) {
      ///this below code will be edited when I set language service
      throw Exception("File not found");
    }
    String result = await file.readAsString();
    Note note = Note.fromJson(jsonDecode(result));
    return note;
  }

  Future<String> updateFile(String title) async {
    String path = directory.path + "\\$title.note";
    Note note = await readFile(title);

    writeln("O'zgartirmoqchi bo'lingan note:");
    writeln(note);
    writeln("Yangilanishni kiriting:");
    String content = "";
    String exit = "";
    while (exit != "Save") {
      exit = read();
      if (exit == "Save") {
        break;
      }
      content += (exit + "\n");
    }
    note.content = content;
    note.time = DateTime.now().toString();
    return await writeFile(note, path);
  }

  Future<String> deleteFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if (!isFileCreated) {
      ///this code will be deleted when I set language service
      throw Exception("This file already created please try create new file");
    }
    await file.delete();
    return file.path;
  }
}
