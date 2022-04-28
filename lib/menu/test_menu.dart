import 'dart:io';
import 'dart:math';

import 'package:learn_english_word_by_word/menu/create_word_menu.dart';
import 'package:learn_english_word_by_word/menu/home_menu.dart';
import 'package:learn_english_word_by_word/models/menu_model.dart';
import 'package:learn_english_word_by_word/services/ext_service.dart';
import 'package:learn_english_word_by_word/services/io_service.dart';

List<String> list = [];
String str = '';

class TestMenu extends Menu {



  static const String id = "/missing_word_test";
  String missingLetter() {
    int t = 0;
    Directory directory = Directory(Directory.current.path + "/assets/files");
    list = List.generate(directory.listSync().length, (index) {
      return directory.listSync()[index].path.split("/").last.split("\\").last;
    });
    int n = 0;
    Set set = {};
    while (n < list.length) {
      var random = Random();
      str = list[random.nextInt(list.length)];
      if (set.add(str)) {
        String letter = str[2];
          font2('\n\n${n+1}.Qaysi harf kiritilishi kerak? ');
          str = str.replaceRange(2, 3, '..');
          print(str);
          String finder = read();
          if (finder == letter) {
            font2('\t\tCorrect ✅');
            t++;
          } else {
            redFont('\t\tWRONG ❌');
          }
          n++;
        }
    }
    font2("\n\t\t\t" + "correct_answers".tr + "=>" + " $t");
    font2('\t\t\t' + 'percent'.tr + '=> ' + ((t * 100) / list.length).toStringAsFixed(2) + '%'+ '\n\n\n');

    return str;
  }

  @override
  Future<void> build() async {
    font2("Menu: " + "missing_word".tr);
    missingLetter();
  }

}
