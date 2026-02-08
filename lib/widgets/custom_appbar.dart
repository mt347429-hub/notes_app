import 'package:flutter/material.dart';
import 'package:notes_app/shared/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: 'Notes',fontSize: 28,),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.08),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(Icons.search, color: Colors.white, size: 35),
        ),
      ],
    );
  }
}
