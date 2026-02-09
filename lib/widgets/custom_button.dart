import 'package:flutter/material.dart';

import '../shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: Color(0xff62fcd7),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(child: CustomText(text: 'Add',color: Colors.black,fontSize: 20,weight: FontWeight.bold,)),
      ),
    );
  }
}
