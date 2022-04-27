

import 'dart:io';

import 'package:learn_english_word_by_word/services/ext_service.dart';
import 'package:learn_english_word_by_word/services/navigation_service.dart';
import '../models/menu_model.dart';
import '../models/word_model.dart';
import '../services/file_service.dart';
import '../services/io_service.dart';

class CreateWordMenu extends Menu {
  static final String id = "/create_note_menu";

  Future<void> createWord() async {
    FileService fileService = FileService();
    await fileService.init();

    write("new_word_name".tr);

    String title = read();
    String path = "";

    try{
      path = await fileService.createFile(title);
    } catch(error) {
      writeln(error);
      await createWord();
    }

    writeln("write_word".tr);
    String content = "";
    String stopWrite = stdin.readLineSync()!;
    content += (stopWrite);

    Word word = Word(word: title, translation: content);
    await fileService.writeFile(word, path);
    writeln("word_save".tr);
    write("\n\n\n\n\n\n");
    await Navigator.pop();
  }

  @override
  Future<void> build() async {
    writeln("Menu: " + "create_word".tr);
    await createWord();
  }
}