import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color=Color (0xffD3F6DB);
  Future<void> addNote(NoteModel note) async {
    note.color=color.value;
  emit(AddNoteLoading());
  try{
    var notesBox= Hive.box<NoteModel>('note_box');
    await notesBox.add(note);
    emit(AddNoteSuccess());
  }catch (e){
    emit(AddNoteFailure(e.toString()));
  }

  }

}
