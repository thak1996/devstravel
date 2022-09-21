import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_appbar.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_drawercustom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinetPage extends StatelessWidget {
  const ContinetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const DsAppBar(title: 'Escolha um continente'),
        drawer: const DsDrawer(),
        body: RefreshIndicator(
            onRefresh: () => Future<void>.delayed(const Duration(seconds: 3)),
            child: Center(child: DsText(text: '...'))),
      ),
    );
  }
}
