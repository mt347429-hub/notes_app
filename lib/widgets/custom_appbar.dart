import 'package:flutter/material.dart';

import '../shared/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.controller,
    this.onChanged
  });

  final String text;
  final IconData icon;
  final void Function()? onPressed;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: text, fontSize: 28),
        const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              onChanged: onChanged ,
              controller: controller,
              decoration: InputDecoration(
                suffixIcon:IconButton(onPressed: onPressed, icon: Icon(icon)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )
      ],
    );
  }
}
