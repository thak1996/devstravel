import 'package:devstravel/src/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';

void main() => runApp(
  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
      },
      initialRoute: '/home',
    );
  }
}
