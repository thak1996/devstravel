import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_appbar.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_drawercustom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const DsAppBar(
            title: 'Busque uma Cidade', hideSearch: false, showBack: true),
        drawer: const DsDrawer(),
        body: RefreshIndicator(
          onRefresh: () => Future<void>.delayed(const Duration(seconds: 3)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [DsText(text: 'Página de Busca...')],
            ),
          ),
        ),
      ),
    );
  }
}
