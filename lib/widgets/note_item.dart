import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

import '../shared/custom_text.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditView();
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Color(note.color),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 24,
            right: 18,
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: CustomText(
                  text: note.title,
                  fontSize: 30,
                  color: Colors.black,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: CustomText(
                    text: note.subtitle,
                    color: Colors.black.withOpacity(.4),
                    fontSize: 20,
                    weight: FontWeight.w400,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<GetNoteCubit>(context).getAllNote();
                  },
                  icon: Icon(Icons.delete, color: Colors.black, size: 30),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomText(
                  text: note.date,
                  fontSize: 16,
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
