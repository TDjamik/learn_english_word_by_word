import 'package:learn_english_word_by_word/menu/select_delete_menu.dart';
import 'package:learn_english_word_by_word/services/navigation_service.dart';
import 'dart:io';

import 'package:learn_english_word_by_word/menu/view_one_note_menu.dart';
import 'package:learn_english_word_by_word/services/ext_service.dart';

import '../models/menu_model.dart';
import '../services/file_service.dart';
import '../services/io_service.dart';
import 'create_note_menu.dart';

class AllWordsMenu extends Menu {
  static const String id = "all_notes_menu";

  Future<void> viewWordList() async {
    FileService fileService = FileService();
    await fileService.init();
    List<FileSystemEntity> files = fileService.directory.listSync();
    if(files.isNotEmpty) {
      for(int i = 0; i < files.length; i++) {
        writeln("${i + 1}. ${files[i].path.substring(files[0].path.lastIndexOf("\\") + 1)}");
      }

      writeln("I. " + "number_note".tr);
      writeln("II. " + "delete_all".tr);
      writeln("III. " + "delete_selected".tr);
      String selectedMenu = read();
      await selectFunctionIf(selectedMenu, files);
    } else {
      writeln("no_note".tr);
      writeln("I. " + "create_note".tr);
      writeln("II. " + "back_to_home".tr);
      String selectedMenu = read();
      await selectFunctionElse(selectedMenu);
    }
  }

  Future<void> selectFunctionIf(String selectedMenu, List<FileSystemEntity> files) async {
    switch(selectedMenu) {
      case "I": {
        write("\n\n\n\n\n\n");
        await Navigator.push(ViewOneWordMenu(list: files));
      } break;
      case "II": {
        write("\n\n\n\n\n\n");
        await FileService().deleteAllFile();
        writeln("Barcha fayllar muvoffaqiyatli o'chirildi!");
        await Navigator.popUntil();
      } break;
      case "III": {
        write("\n\n\n\n\n\n");
        //hali bor
        await Navigator.push(SelectDeleteMenu(list: files));
      } break;
      default: {
        writeln("error".tr);
      }
    }
  }


  Future<void> selectFunctionElse(String selectedMenu) async {
    switch(selectedMenu) {
      case "I": {
        write("\n\n\n\n\n\n");
        await Navigator.pushReplacement(CreateWordMenu());
      } break;
      case "II": {
        write("\n\n\n\n\n\n");
        await Navigator.pop();
      } break;
      default: {
        writeln("error".tr);
      }
    }
  }

  @override
  Future<void> build() async {
    await viewWordList();
  }

}