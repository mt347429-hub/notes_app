
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
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();

}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> key=GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subsTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key:key,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(text: 'Title',onSaved: (val){
            title=val;
          },),
          SizedBox(height: 16,),
          CustomTextField(text: 'Content',maxLine: 5,onSaved: (val){
            subsTitle=val;
          },),
          SizedBox(height: 32,),
          CustomButton(
            onTap: (){
              if(key.currentState!.validate()){
                key.currentState!.save();
              }else{
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });

              }
            },
          ),
          SizedBox(height: 16,),
        ],

      ),
    );
  }
}

