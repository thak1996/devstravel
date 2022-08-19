// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    required this.hideSearch,
  }) : super(key: key);

  final String title;
  bool hideSearch = true;
  bool showDrawer = true;
  bool showBack = true;

  IconButton drawerIcon = IconButton(
    icon: const Icon(Icons.menu, color: Colors.black, size: 30),
    onPressed: () {},
  );

  IconButton backIcon = IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
    onPressed: () {},
  );

  void leadingButton() {
    IconButton leadingButton;
    if (showDrawer) {
      leadingButton = drawerIcon;
    }
    if (showBack) {
      leadingButton = backIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica Neue'),
      ),
      leading: leadingButton(),
      actions: [
        hideSearch
            ? IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {},
              )
            : Container()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
