import 'package:flutter/material.dart';

class TextFieldHd extends StatelessWidget {
  const TextFieldHd({
    super.key,
    this.onChanged,
    required this.label,
  });

  final Function(String)? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          color: Color(0xFFDBDADA),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 0.09,
        ),
        // keyboardType: TextInputType.multiline,
        // textInputAction: TextInputAction.newline,
        // minLines: 1,
        // maxLines: 10,
        decoration: InputDecoration(
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
