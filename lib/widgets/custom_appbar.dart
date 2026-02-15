import 'package:flutter/material.dart';

import '../shared/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    required this.isTextFormField,
    this.controller,
  });

  final String text;
  final IconData icon;
  final void Function()? onTap;
  final bool isTextFormField;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: text, fontSize: 28),
        const SizedBox(width: 16),
        if (isTextFormField)
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: Icon(icon),
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
        else ...[
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
          ),
        ],
      ],
    );
  }
}
