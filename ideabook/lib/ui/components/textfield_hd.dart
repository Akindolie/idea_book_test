import 'package:flutter/material.dart';

import '../common/text_styles.dart';

class TextFieldHd extends StatelessWidget {
  const TextFieldHd({
    super.key,
    this.onChanged,
    required this.label,
    required this.controller,
  });

  final Function(String)? onChanged;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: kTitleTS,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: -10.0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: label,
          hintStyle: const TextStyle(
            color: Color(0x51DCDADA),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }
}
