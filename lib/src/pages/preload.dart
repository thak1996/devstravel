import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/appdata.dart';

class Preload extends StatefulWidget {
  const Preload({super.key});

  @override
  State<Preload> createState() => _Preload();
}

class _Preload extends State<Preload> {
  bool loading = true;

  Future<void> requestInfo() async {
    Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = true;
    });
    bool req = await Provider.of<AppData>(context, listen: false).requestData();
    if (req) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/flutter1_devstravel_logo.png',
              width: 200,
            ),
            loading
                ? Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      'Carregando',
                      style: TextStyle(fontSize: 16),
                    ))
                : Container(),
            loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  )
                : Container(),
            !loading
                ? Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: const Text('Tentar Novamente'),
                      onPressed: () {},
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
