import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_mediaquerry.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_appbar.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_citybox.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_drawercustom.dart';
import 'package:devstravel/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinetPage extends StatelessWidget {
  const ContinetPage({super.key});

  void seeCityAction(context, index) {
    Navigator.pushNamed(context, '/listcity', arguments: index);
  }

  void cityBoxAction(cityData) {}

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const DsAppBar(title: 'Escolha um continente'),
        drawer: const DsDrawer(),
        body: RefreshIndicator(
          onRefresh: () => Future<void>.delayed(const Duration(seconds: 3)),
          child: ListView.builder(
            itemCount: appdata.data.length,
            itemBuilder: (context, index) {
              List<dynamic> cities = [];
              for (var country in appdata.data[index]['countries']) {
                cities.addAll(country['cities']);
              }
              return Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: screenSize(context).width * .02),
                            child: DsText(
                                text:
                                    "${appdata.data[index]['name']}: ${cities.length}",
                                style: subTitlePrimary.copyWith(fontSize: 16))),
                        TextButton(
                            onPressed: () => seeCityAction(context, index),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    right: screenSize(context).width * .04,
                                    left: screenSize(context).width * .04,
                                    bottom: screenSize(context).height * .001,
                                    top: screenSize(context).height * .001),
                                child: DsText(
                                    text: 'Ver Cidades',
                                    style: textSimple.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey))))
                      ]),
                  Container(
                      height: screenSize(context).height * .20,
                      margin: EdgeInsets.only(
                          top: screenSize(context).height * .015,
                          bottom: screenSize(context).height * .03),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cities.length,
                          itemBuilder: (context, index) {
                            return CityBox(
                                data: cities[index], onTap: cityBoxAction);
                          }))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
