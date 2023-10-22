import 'package:flutter/material.dart';

class TextFieldBd extends StatelessWidget {
  const TextFieldBd({
    super.key,
    this.onChanged,
    required this.label,
  });

  final Function(String)? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          color: Color(0xFFDBDADA),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0.09,
        ),
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        minLines: 1,
        maxLines: 10,
        decoration: InputDecoration(
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
