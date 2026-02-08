import 'package:flutter/material.dart';
import 'custom_appbar.dart';
import 'note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 12),
                itemCount: 10,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: NoteItem(),
              );
            }),
          )
        ],
      ),
    );
  }
}

