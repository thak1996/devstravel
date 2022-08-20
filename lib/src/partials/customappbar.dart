import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    this.hideSearch = false,
    this.showDrawer = false,
    this.showBack = false,
  }) : super(key: key);

  final String title;
  bool hideSearch;
  bool showDrawer;
  bool showBack;

  IconButton drawerIcon = IconButton(
    icon: const Icon(Icons.menu, color: Colors.black, size: 30),
    onPressed: () {},
  );

  IconButton backIcon = IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
    onPressed: () {},
  );

  IconButton? leadingButton() {
    if (showDrawer) {
      return drawerIcon;
    }
    if (showBack) {
      return backIcon;
    }
    return null;
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
            ? Container()
            : IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {},
              )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
