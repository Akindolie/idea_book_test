import 'package:flutter/material.dart';

import '../common/text_styles.dart';

class TextFieldBd extends StatelessWidget {
  const TextFieldBd({
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
    return Expanded(
      flex: 4,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: kBodyTS,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        minLines: 1,
        maxLines: 10,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: label,
          hintStyle: const TextStyle(
            color: Color(0x51DCDADA),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
    );
  }
}
