import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/shared/styles.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_mediaquerry.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Preload extends StatefulWidget {
  const Preload({super.key});

  @override
  State<Preload> createState() => _Preload();
}

class _Preload extends State<Preload> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  void requestInfo() async {
    Future.delayed(const Duration(seconds: 2));
    final bool req =
        await Provider.of<AppData>(context, listen: false).requestData();
    req
        // ignore: use_build_context_synchronously
        ? Navigator.pushReplacementNamed(context, '/home')
        : setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/flutter1_devstravel_logo.png',
                width: screenSize(context).width * .5,
                height: screenSize(context).height * .5),
            loading
                ? Container(
                    margin: EdgeInsets.all(screenSize(context).height * .02),
                    child: DsText(
                        text: 'Carregando',
                        style: h4Bold.copyWith(fontSize: 16)))
                : Container(),
            loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green))
                : Container(),
            !loading
                ? Container(
                    margin: EdgeInsets.all(screenSize(context).height * .02),
                    child: ElevatedButton(
                        child: const DsText(text: 'Tentar Novamente'),
                        onPressed: () {}))
                : Container(),
          ],
        ),
      ),
    );
  }
}
