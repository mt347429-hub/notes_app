
import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0,horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(text: 'Title',),
            SizedBox(height: 16,),
            CustomTextField(text: 'Content',maxLine: 5,),
            SizedBox(height: 32,),
            CustomButton(),
            SizedBox(height: 16,),
          ],

        ),
      ),
    );
  }
}

