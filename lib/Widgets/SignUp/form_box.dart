import 'package:flutter/material.dart';
import 'package:show_bazzar/core/utils/constants/sizes.dart';

class FormBox extends StatelessWidget {
  const FormBox({super.key, required this.labelFormText});
  final String labelFormText;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(80),
        ),
        child: TextFormField(
          style: TextStyle(color: Colors.black),

          decoration: InputDecoration(
            labelText: labelFormText,
            hoverColor: Colors.black,
            focusColor: Colors.black,
            labelStyle:
                const TextStyle(color: Colors.grey, fontSize: TSizes.fontSizeSm),
          ),
          expands: false,
        ),
      ),
    );
  }
}
