import 'package:learn_english_word_by_word/menu/all_words_menu.dart';
import 'package:learn_english_word_by_word/menu/create_word_menu.dart';
import 'package:learn_english_word_by_word/menu/etid_word_menu.dart';
import 'package:learn_english_word_by_word/menu/home_menu.dart';
import 'package:learn_english_word_by_word/menu/select_delete_menu.dart';
import 'package:learn_english_word_by_word/menu/test_menu.dart';
import 'package:learn_english_word_by_word/menu/view_one_word_menu.dart';
import 'package:learn_english_word_by_word/services/lang_service.dart';
import 'package:learn_english_word_by_word/services/word_service.dart';

void font1(String value){
print('\x1b[51m $value \x1b[0m');
}





void main() async {
  // print(TestMenu().adding());
  // TestMenu testMenu = TestMenu();
  // testMenu.missingLetter();

font1("MMP appga xush kelibsiz");
  MyApp(
    home: HomeMenu(),
    locale: await LangService.currentLanguage(),
    routes: {
      // key: value
      // /home_menu: HomeMenu()
      HomeMenu.id: HomeMenu(),
      CreateWordMenu.id: CreateWordMenu(),
      AllWordsMenu.id: AllWordsMenu(),
      ViewOneWordMenu.id: ViewOneWordMenu(),
      EditWordMenu.id: EditWordMenu(),
      SelectDeleteMenu.id: SelectDeleteMenu(),
      TestMenu.id: TestMenu(),
    },
  );

}
