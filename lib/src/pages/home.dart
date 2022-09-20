import 'package:devstravel/src/shared/design_system/atoms/ds_mediaquerry.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_appbar.dart';
import 'package:devstravel/src/shared/design_system/molecules/ds_drawercustom.dart';
import 'package:devstravel/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        appBar: const DsAppBar(title: 'Home Page'),
        drawer: const DsDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DsText(text: 'Bem vindo(a) ao', style: h4Bold),
              SizedBox(height: screenSize(context).height * .01),
              Image.asset('assets/flutter1_devstravel_logo.png',
                  width: screenSize(context).width * 0.5,
                  height: screenSize(context).height * 0.5),
              SizedBox(height: screenSize(context).height * .01),
              const DsText(text: 'Seu guia de viagem perfeito', style: h4Bold),
            ],
          ),
        ),
      ),
    );
  }
}
