



import 'package:learn_english_word_by_word/menu/create_word_menu.dart';
import 'package:learn_english_word_by_word/models/menu_model.dart';
import 'package:learn_english_word_by_word/services/data_service.dart';
import 'package:learn_english_word_by_word/services/ext_service.dart';
import 'package:learn_english_word_by_word/services/lang_service.dart';
import 'package:learn_english_word_by_word/services/navigation_service.dart';

import 'io_service.dart';

class SettingLanguage extends Menu {



  Future<void>settingLang(String selectedMenu) async {

    switch (selectedMenu) {
      case "I":
        {
          write("\n\n\n");
          LangService.language = Language.uz;
        }
        break;
      case "II":
        {
          write("\n\n\n");
          LangService.language = Language.en;
        }
        break;
      case "III":
        {
          write("\n\n\n");
          LangService.language = Language.ru;
        }
        break;

      default:
        {
          writeln("error".tr);
        }

    }



    Navigator.popUntil();

  }

    @override
    Future<void> build() async {
      DataService dataService = DataService();
      await dataService.init();
      font2_2("update_lang".tr);
      font2("I. " "UZ");
      font2("II. " "EN");
      font2("III. " "RU");
      String selectedMenu = read();
      await settingLang(selectedMenu);
    await dataService.storeData(key: "language", value: LangService.language.name);

  }
}
