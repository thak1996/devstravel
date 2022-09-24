import 'package:devstravel/src/shared/design_system/molecules/ds_appbar.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_citybox.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_drawercustom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class FavoritesPages extends StatelessWidget {
  const FavoritesPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List favorites = appdata.favoritesCities();
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const DsAppBar(title: 'Cidades Salvas', hideSearch: true),
        drawer: const DsDrawer(),
        body: RefreshIndicator(
          onRefresh: () => Future<void>.delayed(const Duration(seconds: 3)),
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(favorites.length, (index) {
              return CityBox(
                data: favorites[index],
                onTap: (data) {
                  Navigator.pushNamed(context, '/city', arguments: data);
                },
              );
            }),
          ),
        ),
      );
    });
  }
}
