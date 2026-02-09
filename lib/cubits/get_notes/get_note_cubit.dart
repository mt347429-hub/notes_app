import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());

  void getAllNote() {
    emit(GetNoteLoading());
    try {
      var box = Hive.box<NoteModel>('note_box');
      List<NoteModel> notes = box.values.toList();
      emit(GetNoteSuccess(notes));
    } catch (e) {
      emit(GetNoteFailure(e.toString()));
    }
  }
}
