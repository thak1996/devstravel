import 'package:devstravel/src/shared/app_colors.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/styles.dart';
import 'package:flutter/material.dart';

class DsDrawer extends StatelessWidget {
  const DsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: azulOceano),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DsText(
                        text: 'DevsTravel',
                        style: h5Primary.copyWith(
                            color: whiteColor, fontWeight: FontWeight.w700)),
                    DsText(
                        text: 'Versão 1.0',
                        style: textSimple.copyWith(color: whiteColor))
                  ])),
          ListTile(
            leading: const Icon(Icons.home, color: blackColor),
            title: const DsText(text: 'Home', style: h7Primary),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: const Icon(Icons.public, color: blackColor),
            title: const DsText(text: 'Escolher Continente', style: h7Primary),
            onTap: () => Navigator.pushReplacementNamed(context, '/continent'),
          ),
          ListTile(
            leading: const Icon(Icons.search, color: blackColor),
            title: const DsText(text: 'Buscar Cidade', style: h7Primary),
            onTap: () => Navigator.pushReplacementNamed(context, '/search'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: blackColor),
            title: const DsText(text: 'Cidades Salvas', style: h7Primary),
            onTap: () => Navigator.pushReplacementNamed(context, '/favorites'),
          ),
        ],
      ),
    );
  }
}
