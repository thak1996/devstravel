import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
              ),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: Text(
                      'Bem vindo(a) ao',
                      style: styles,
                    ),
                  ),
                  Image.asset(
                    'lib/assets/flutter1_devstravel_logo.png',
                    width: 200,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Text(
                      'Seu guioa de viagem perfeito',
                      style: styles,
                    ),
                  )
                ],
              )),
            ));
  }
}
