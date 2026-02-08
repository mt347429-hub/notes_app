import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import 'custom_appbar.dart';
class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(text: 'Edit Note',icon: Icons.check,),
          SizedBox(height: 12,),
          CustomTextField(text: 'Title'),
          SizedBox(height: 16,),
          CustomTextField(text: 'Content',maxLine: 5,),




        ],

      ),
    );
  }
}
