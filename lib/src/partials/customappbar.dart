import 'package:flutter/material.dart';

// Widget CustomAppBar() {
//   return AppBar(
//     title: Text('AppBar Peronalizado'),
//   );
// }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'AppBar Personalizado',
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica Neue'),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black,size: 30),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
