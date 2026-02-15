import 'package:flutter/material.dart';


import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          backgroundColor: Colors.teal,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16)
              ),
              context: context, builder: (context) {
              return AddNoteBottomSheet();
            },
            );
          },
          child: Icon(Icons.add,),
        ),
      ),
    );
  }
}


