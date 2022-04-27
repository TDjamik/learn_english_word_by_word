

import 'dart:html';

import '../models/menu_model.dart';
import '../services/file_service.dart';

class EditNoteMenu extends Menu {
  static const String id = "/edit_note_menu";
  String? path;

  EditNoteMenu({this.path});

  @override
  Future<void> build() async {
    FileService fileService = FileService();
    await fileService.updateFileFromPath(path!);
    await Navigator.pop();
  }

}