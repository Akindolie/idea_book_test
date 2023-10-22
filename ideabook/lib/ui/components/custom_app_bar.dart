import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 30,
      leading: IconButton(
        icon: const Icon(
          IconlyLight.arrow_left,
          size: 24,
        ),
        onPressed: () {},
      ),
      title: const Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/logo.jpeg"),
            radius: 20,
          ),
          horizontalSpaceSmall,
          Text('IdeaBook'),
        ],
      ),
      iconTheme: const IconThemeData(color: kcVeryLightGrey),
      backgroundColor: kcMediumGrey,
    );
  }

  static final _appBar = AppBar();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => _appBar.preferredSize;
}
