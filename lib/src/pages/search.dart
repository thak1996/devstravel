import 'package:devstravel/src/shared/design_system/atoms/ds_text_field.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_appbar.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_citybox.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_drawercustom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  var list = [];
  Future<void> doSearch(context, text) async {
    List<dynamic> newList =
        Provider.of<AppData>(context, listen: false).searchCity(text);
    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const DsAppBar(
            title: 'Busque uma Cidade', hideSearch: false, showBack: false),
        drawer: const DsDrawer(),
        body: RefreshIndicator(
            onRefresh: () => Future<void>.delayed(const Duration(seconds: 3)),
            child: Column(
              children: [
                DsTextField(
                    left: .05,
                    right: .05,
                    top: .02,
                    bottom: .025,
                    maxLines: 1,
                    hintText: 'Digite o nome de uma cidade',
                    icon: const Icon(Icons.search),
                    controller: searchController,
                    onChanged: (text) {
                      doSearch(context, text);
                    }),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(list.length, (index) {
                    return CityBox(
                      data: list[index],
                      onTap: (data) {
                        Navigator.pushNamed(context, '/city', arguments: data);
                      },
                    );
                  }),
                ))
              ],
            )),
      ),
    );
  }
}
