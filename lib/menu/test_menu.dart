import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:learn_english_word_by_word/models/menu_model.dart';
import 'package:learn_english_word_by_word/services/ext_service.dart';
import 'package:learn_english_word_by_word/services/io_service.dart';
import 'package:learn_english_word_by_word/services/navigation_service.dart';

List<String> list = [];
List<String> list2 = [];
List<String> listTrans = [];
String str = '';

class TestMenu extends Menu {
  static const String id = "/missing_word_test";


  Future<String> missingLetter() async{
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
        print('\n\n${n + 1}' '.'+ "which_letter".tr);
        str = str.replaceRange(2, 3, '..');
        print(str);
        String finder = read();
        if (finder == letter) {
          print('\t\tCorrect ✅');
          t++;
        } else {
          print('\t\tWRONG ❌');
        }
        n++;
      }
    }
    print("\n\t\t\t" + "correct_answers".tr + "=>" + " $t");
    print('\t\t\t' + 'percent'.tr + '=> ' + ((t * 100) / list.length).toStringAsFixed(2) + '%' + '\n\n\n');

    return str;
  }

  Future<String> comparison() async{
    int t = 0;

    Directory directory = Directory(Directory.current.path + "/assets/files");
    list2 = List.generate(directory.listSync().length, (index) {
      return directory.listSync()[index].path.split("/").last.split("\\").last;
    });
    String catcher1 = '';
    String catcher2 = '';
    String catcher3 = '';

    bool ig = true;

    List l = [];

    for (int i = 0; i < list2.length; i++) {
      l.addAll(list2);
      l.remove(list2[i]);
      Set<String> set = {};

      set.add(l[Random().nextInt(l.length)]);
      set.add(l[Random().nextInt(l.length)]);
      set.add(l[Random().nextInt(l.length)]);

      if (set.length == 3) {
        do {
          if (set.length == 3) {
            ig = false;
          } else {
            set.add(l[Random().nextInt(l.length)]);
          }
        } while (ig);

        catcher1 = set.elementAt(0);
        catcher2 = set.elementAt(1);
        catcher3 = set.elementAt(2);
      } else if (set.length < 3) {
        do {
          if (set.length == 2) {
            ig = false;
          } else {
            set.add(l[Random().nextInt(l.length)]);
          }
        } while (ig);
        catcher1 = set.elementAt(0);
        catcher2 = set.elementAt(1);
      }
      String translation = '';
      String translation1 = '';
      String translation2 = '';
      String translation3 = '';

      translation = jsonDecode(File(directory.path + "/${list2[i]}").readAsStringSync())["translation"];
      translation1 = jsonDecode(File(directory.path + "/$catcher1").readAsStringSync())["translation"];
      translation2 = jsonDecode(File(directory.path + "/$catcher2").readAsStringSync())["translation"];
      translation3 = jsonDecode(File(directory.path + "/$catcher3").readAsStringSync())["translation"];

      List ranList = [translation, translation3, translation2, translation1];

      ranList.shuffle();

      print('\n\t\t\t\t\t\t a) ${ranList[0]}\n'
          '\n\t\t\t\t\t\t b) ${ranList[1]}\n'
          '${list2[i]}'
          '\n\t\t\t\t\t\t c) ${ranList[2]}\n'
          '\n\t\t\t\t\t\t d) ${ranList[3]}\n');

      String finder = read();

      List listVersion = ["a", "b", "c", "d"];

      if (listVersion.indexOf(finder) == ranList.indexOf(translation)) {
        print('\t\tCorrect ✅');
        t++;
      } else {
        print('\t\tWRONG ❌');
      }

      l = [];
    }

    print("\n\t\t\t" + "correct_answers".tr + " =>" + " $t");
    print('\t\t\t' + 'percent'.tr + ' => ' +
        ((t * 100) / list2.length).toStringAsFixed(2) + ' %' + '\n\n\n');
    return '$t';
  }

  Future<void> selectFunction(String selectedMenu) async {
    switch (selectedMenu) {
      case "I":
        {
          write("\n\n\n");
          await missingLetter();
          await Navigator.popUntil();
        }
        break;
      case "II":
        {
          write("\n\n\n");
          await comparison();
          await Navigator.popUntil();
        }
        break;
      case "III":
        {
          write("\n\n\n");
          await Navigator.popUntil();
        }
        break;
    }
  }



  @override
  Future<void> build() async {
    writeln("I. " + "missing_word".tr);
    writeln("II. " + "second_game".tr);
    writeln("III. " + "back_to_home".tr);
    String selectedMenu = read();
    selectFunction(selectedMenu);
  }
}
