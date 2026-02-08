import 'package:flutter/material.dart';

import '../shared/custom_text.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      color: Color(0xffffcc80),
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
                text: 'Flutter tips',
                fontSize: 30,
                color: Colors.black,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: CustomText(
                  text: 'Build your carer with Mahmoud Tarek',
                  color: Colors.black.withOpacity(.4),
                  fontSize: 20,
                  weight: FontWeight.w400,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.black, size: 30),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomText(
                text: 'Feb 08.02.2026',
                fontSize: 16,
                color: Colors.black.withOpacity(.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
