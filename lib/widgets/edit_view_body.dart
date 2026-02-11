import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import 'custom_appbar.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

String? title;
String? subTitle;

class _EditViewBodyState extends State<EditViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            text: 'Edit Note',
            icon: Icons.check,
            onTap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = subTitle ?? widget.note.subtitle;
              Navigator.pop(context);
              BlocProvider.of<GetNoteCubit>(context).getAllNote();
            },
          ),
          SizedBox(height: 12),
          CustomTextField(
            text: widget.note.title,
            onChanged: (val) {
              title = val;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            text: widget.note.subtitle,
            maxLine: 5,
            onChanged: (val) {
              subTitle = val;
            },
          ),
        ],
      ),
    );
  }
}
