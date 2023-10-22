import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.onTap,
    required this.disable,
  });
  final VoidCallback onTap;
  final bool disable;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disable ? null : onTap,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          color: disable ? Colors.transparent : const Color(0xFF3E4370),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.send,
          color: kcLightGrey,
          size: 18,
        ),
      ),
    );
  }
}
