part of 'get_note_cubit.dart';

@immutable
sealed class GetNoteState {}

final class GetNoteInitial extends GetNoteState {}

final class GetNoteSuccess extends GetNoteState {
  final List<NoteModel> notes;
  final bool isSearching;
  GetNoteSuccess({required this.notes,required this.isSearching});
}
