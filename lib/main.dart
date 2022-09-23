import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/pages/city.dart';
import 'package:devstravel/src/pages/continent.dart';
import 'package:devstravel/src/pages/home.dart';
import 'package:devstravel/src/pages/listcity.dart';
import 'package:devstravel/src/pages/preload.dart';
import 'package:devstravel/src/pages/search.dart';
import 'package:devstravel/src/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AppData()),
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: whiteColor),
      title: 'DevsTravel',
      initialRoute: '/',
      routes: {
        '/': (context) => const Preload(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/listcity': (context) => const ListCityPage(),
        '/continent': (context) => const ContinetPage(),
        '/city': (context) => const CityPage(),
      },
    );
  }
}
