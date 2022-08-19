import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/pages/home.dart';
import 'src/models/appdata.dart';
import 'src/pages/preload.dart';

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
      debugShowCheckedModeBanner:false,
      routes: {
        '/preload': (context) => PreloadPage(),
        '/home': (context) => HomePage(),
      },
      initialRoute: '/preload',
    );
  }
}
