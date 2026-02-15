import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared/custom_text.dart';
import 'custom_appbar.dart';
import 'note_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNoteCubit>(context).getAllNote();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 50),
          BlocBuilder<GetNoteCubit, GetNoteState>(
            builder: (context, state) {
              bool isSearching = false;
              if (state is GetNoteSuccess) {
                isSearching = state.isSearching;
              }
              return CustomAppBar(
                controller: searchController,
                text: 'Notes',
                icon: isSearching ? Icons.clear : Icons.search,
                onPressed: () {
                  if (isSearching) {
                    searchController.clear();
                    context.read<GetNoteCubit>().searchFunction('');
                  }
                },
                onChanged: (value) {
                  context.read<GetNoteCubit>().searchFunction(value);
                },
              );
            },
          ),
          Expanded(
            child: BlocBuilder<GetNoteCubit, GetNoteState>(
              builder: (context, state) {
                List<NoteModel> notes = [];
                if (state is GetNoteSuccess) {
                  notes = state.notes;
                }
                return notes.isEmpty
                    ? Center(
                        child: CustomText(
                          text: 'No notes to display',
                          fontSize: 24,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 12),
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: NoteItem(note: notes[index]),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
