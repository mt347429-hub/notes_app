import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'custom_appbar.dart';
import 'note_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();



}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  @override
  void initState() {
    BlocProvider.of<GetNoteCubit>(context).getAllNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(text: 'Notes', icon: Icons.search),
          Expanded(
            child: BlocBuilder<GetNoteCubit, GetNoteState>(
              builder: (context, state) {
                List <NoteModel> notes=BlocProvider.of<GetNoteCubit>(context).notes!;
                return ListView.builder(
                  padding: EdgeInsets.only(top: 12),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: NoteItem(
                        note: notes[index],
                      ),
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
