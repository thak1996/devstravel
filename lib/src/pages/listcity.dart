import 'package:devstravel/src/shared/design_system/molecules/ds_appbar.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_citybox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class ListCityPage extends StatelessWidget {
  const ListCityPage({super.key});

  void cityBoxAction(context, data) {
    Navigator.pushNamed(context, '/city', arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments;
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List<dynamic> cities = [];
      for (var country in appdata.data[index as int]['countries']) {
        cities.addAll(country['cities']);
      }
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: DsAppBar(
            title: "${appdata.data[index]['name']}: ${cities.length} Cidades",
            showBack: true),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(cities.length, (index) {
            return CityBox(
                data: cities[index],
                onTap: (data) => cityBoxAction(context, data));
          }),
        ),
      );
    });
  }
}
