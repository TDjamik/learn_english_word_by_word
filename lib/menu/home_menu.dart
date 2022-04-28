import 'dart:io';
import 'package:learn_english_word_by_word/menu/test_menu.dart';
import 'package:learn_english_word_by_word/services/ext_service.dart';
import '../models/menu_model.dart';
import '../services/io_service.dart';
import 'all_words_menu.dart';
import 'package:learn_english_word_by_word/services/navigation_service.dart';
import 'create_word_menu.dart';

class HomeMenu extends Menu{
  static const String id = "/home_menu";

  Future<void> selectFunction(String selectedMenu) async {
    switch(selectedMenu) {
      case "I": {
        write("\n\n\n");
        await Navigator.push(CreateWordMenu());
      } break;
      case "II": {
        write("\n\n\n");
        await Navigator.push(AllWordsMenu());
      } break;
      case "III": {
        write("\n\n\n");
        await Navigator.push(TestMenu());
      } break;
      case "IV": {
        write("\n\n\n");

      } break;
      case "V": exit(0);
      default: {
        writeln("error".tr);
      }
    }
  }

  @override
  Future<void> build() async {
    writeln("I. " + "create_word".tr);
    writeln("II. " + "view_all_words".tr);
    writeln("III. " + "test".tr);
    writeln("IV. " + "settings".tr);
    writeln("V. " + "exit".tr);
    String selectedMenu = read();
    await selectFunction(selectedMenu);
  }
}