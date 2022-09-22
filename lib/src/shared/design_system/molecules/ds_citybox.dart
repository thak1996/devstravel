import 'package:devstravel/src/shared/app_colors.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_mediaquerry.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/styles.dart';
import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  const CityBox({super.key, required this.data, required this.onTap});

  final Function onTap;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: screenSize(context).height * .01,
          left: screenSize(context).height * .01),
      child: GestureDetector(
        onTap: () {
          onTap(data);
        },
        child: Stack(
          children: [
            AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)))),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  data['places'][0]['img'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [transparent, blackColor])))),
            Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: DsText(
                    text: data['name'],
                    textAlign: TextAlign.center,
                    style: h7Primary.copyWith(
                        color: whiteColor, fontWeight: FontWeight.w500)))
          ],
        ),
      ),
    );
  }
}
