import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_container.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}


class _EditViewBodyState extends State<EditViewBody> {
  late TextEditingController titleController;
  late TextEditingController subTitleController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    subTitleController=TextEditingController(text: widget.note.subtitle);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomContainer(
              icon: Icons.check,
              onPressed: () {
                widget.note.title = titleController.text;
                widget.note.subtitle = subTitleController.text;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<GetNoteCubit>(context).getAllNote();
              },
            ),
            SizedBox(height: 12),
            CustomTextField(
              controller:titleController ,
              text: widget.note.title,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: subTitleController ,
              text: widget.note.subtitle,
              minLine: 1,
              maxLine:null,
            ),
          ],
        ),
      ),
    );
  }
}
