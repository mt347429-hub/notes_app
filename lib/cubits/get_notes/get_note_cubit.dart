import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());

  List<NoteModel> notes = [];
  List<NoteModel> filteredNotes = [];

  void getAllNote() {
    var box = Hive.box<NoteModel>('note_box');
    notes = box.values.toList();
    emit(GetNoteSuccess(notes: notes, isSearching: false));
  }

  void searchFunction(String query) {
    if (query.isEmpty) {
      emit(GetNoteSuccess(notes: notes, isSearching: false));
      return;
    } else {
      filteredNotes = notes.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    emit(GetNoteSuccess(notes: filteredNotes, isSearching: true));
  }
}
