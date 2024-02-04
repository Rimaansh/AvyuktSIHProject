import 'package:flutter/cupertino.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
  List<Note> allNotes = [
    Note(id: 0, text: "First Note"),
  ];

  List<Note> getAllNotes() {
    return allNotes;
  }

  void addNote(Note nt) {
    allNotes.add(nt);
    notifyListeners();
  }

  void updateNote(Note nt, String txt) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == nt.id) {
        allNotes[i].text = txt;
      }
    }
  }

  void deleteNote(Note nt) {
    allNotes.remove(nt);
  }
}
