import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes/get_note_cubit.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../models/note_model.dart';

class FavouriteNotes extends StatelessWidget {
  const FavouriteNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('Favourite Notes', style: TextStyle(fontSize: 26)),
        leadingWidth: 300,
        actions: [Icon(Icons.favorite, size: 40, color: Colors.red)],
      ),
      body: BlocBuilder<GetNoteCubit, GetNoteState>(
        builder: (context, state) {
          List<NoteModel> favNotes = [];
          if (state is GetNoteSuccess) {
            favNotes = state.notes.where((n) => n.isFavourite).toList();
          }
          if (favNotes.isEmpty) {
            return Center(
              child: Text('No Favourites yet!', style: TextStyle(fontSize: 24)),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ListView.builder(
              itemCount: favNotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: NoteItem(note: favNotes[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
