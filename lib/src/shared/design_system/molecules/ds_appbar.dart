import 'package:devstravel/src/shared/app_colors.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_mediaquerry.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/styles.dart';
import 'package:flutter/material.dart';

class DsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DsAppBar({
    Key? key,
    this.hideSearch = false,
    this.showBack = false,
    required this.title,
  }) : super(key: key);

  final String title;
  final bool hideSearch;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      centerTitle: false,
      title: DsText(text: title, style: h5Primary),
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: blackColor, size: 30),
              onPressed: () => Navigator.pop(context))
          : IconButton(
              icon: const Icon(Icons.menu, color: blackColor, size: 30),
              onPressed: () => Scaffold.of(context).openDrawer()),
      actions: [
        hideSearch
            ? IconButton(
                padding: EdgeInsets.only(
                    right: screenSize(context).width * .03,
                    left: screenSize(context).width * .02),
                icon: const Icon(Icons.search, color: blackColor, size: 30),
                onPressed: () => Navigator.pushNamed(context, '/search'))
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
