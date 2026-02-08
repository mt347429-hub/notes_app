import 'package:flutter/material.dart';

import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: Icon(Icons.add,),
      ),
    );
  }
}
