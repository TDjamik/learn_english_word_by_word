

import 'package:learn_english_word_by_word/services/ext_service.dart';
import 'package:learn_english_word_by_word/services/navigation_service.dart';
import '../models/menu_model.dart';
import '../models/note_model.dart';
import '../services/file_service.dart';
import '../services/io_service.dart';

class CreateNoteMenu extends Menu {
  static final String id = "/create_note_menu";

  Future<void> createNote() async {
    FileService fileService = FileService();
    await fileService.init();

    write("new_note_name".tr);

    String title = read();
    String path = "";

    try{
      path = await fileService.createFile(title);
    } catch(error) {
      writeln(error);
      await createNote();
    }

    writeln("write_note".tr);
    String content = "";
    String stopWrite = "";

    while(true) {
      stopWrite = read();
      if(stopWrite == 'save'.tr) {
        break;
      }
      content += (stopWrite + "\n");
    }

    Note note = Note(title: title, content: content);
    await fileService.writeFile(note, path);
    writeln("note_save".tr);
    write("\n\n\n\n\n\n");
    await Navigator.pop();
  }

  @override
  Future<void> build() async {
    writeln("Menu: " + "create_note".tr);
    await createNote();
  }
}