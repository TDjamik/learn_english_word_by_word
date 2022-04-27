import 'package:learn_english_word_by_word/menu/all_notes_menu.dart';
import 'package:learn_english_word_by_word/menu/create_note_menu.dart';
import 'package:learn_english_word_by_word/menu/etid_note_menu.dart';
import 'package:learn_english_word_by_word/menu/home_menu.dart';
import 'package:learn_english_word_by_word/menu/select_delete_menu.dart';
import 'package:learn_english_word_by_word/menu/view_one_note_menu.dart';
import 'package:learn_english_word_by_word/services/lang_service.dart';
import 'package:learn_english_word_by_word/services/note_service.dart';

void main() async {

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
      EditNoteMenu.id: EditNoteMenu(),
      SelectDeleteMenu.id: SelectDeleteMenu(),
    },
  );
}
