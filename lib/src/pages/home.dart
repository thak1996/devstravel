import 'package:devstravel/src/shared/design_pattern/atoms/ds_mediaquerry.dart';
import 'package:devstravel/src/shared/design_pattern/atoms/ds_text.dart';
import 'package:devstravel/src/shared/design_pattern/molecules/customappbar.dart';
import 'package:devstravel/src/shared/atyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        appBar: CustomAppBar(title: 'Página Home', hideSearch: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DsText(text: 'Bem vindo(a) ao', style: h4Bbold),
              SizedBox(height: screenSize(context).height * .02),
              Image.asset('assets/flutter1_devstravel_logo.png',
                  width: screenSize(context).width * 0.5),
              SizedBox(height: screenSize(context).height * .02),
              const DsText(text: 'Seu guia de viagem perfeito', style: h4Bbold),
            ],
          ),
        ),
      ),
    );
  }
}
