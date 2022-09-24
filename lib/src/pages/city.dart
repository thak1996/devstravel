import 'package:devstravel/src/shared/design_system/atoms/ds_mediaquerry.dart';
import 'package:devstravel/src/shared/design_system/atoms/ds_text.dart';
import 'package:devstravel/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/models/appdata.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  void backButtonAction(context) => Navigator.pop(context);

  bool heart = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerheight = MediaQuery.of(context).padding.bottom;
    List<dynamic> stars = [];
    int starRate = double.parse(data['review']).floor();
    for (var i = 0; i < 5; i++) {
      (i < starRate) ? stars.add(true) : stars.add(false);
    }
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      heart = appdata.hasFavorite(data['name']);
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: RefreshIndicator(
          onRefresh: () => Future<void>.delayed(const Duration(seconds: 3)),
          child: Stack(children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: screenSize(context).width * .6,
                child:
                    Image.network(data['places'][0]['img'], fit: BoxFit.cover)),
            ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(top: screenSize(context).width * .57),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      left: screenSize(context).width * .04,
                                      top: screenSize(context).height * .02),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                bottom:
                                                    screenSize(context).height *
                                                        .005),
                                            child: DsText(
                                                text: data['name'],
                                                style: h5Primary)),
                                        Row(children: [
                                          Icon(Icons.star,
                                              size: 16,
                                              color: starRate > 0
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          Icon(Icons.star,
                                              size: 16,
                                              color: starRate > 1
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          Icon(Icons.star,
                                              size: 16,
                                              color: starRate > 2
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          Icon(Icons.star,
                                              size: 16,
                                              color: stars[3]
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          Icon(Icons.star,
                                              size: 16,
                                              color: stars[4]
                                                  ? Colors.blue
                                                  : Colors.grey),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: screenSize(context)
                                                          .height *
                                                      .01),
                                              child:
                                                  DsText(text: data['review']))
                                        ])
                                      ])),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: screenSize(context).width * .05),
                                  child: IconButton(
                                      icon: Icon(
                                          color: Colors.red,
                                          heart
                                              ? Icons.favorite
                                              : Icons.favorite_border),
                                      onPressed: () {
                                        setState(() {
                                          heart =
                                              appdata.favorite(data['name']);
                                        });
                                      }))
                            ]),
                        Container(
                            margin: EdgeInsets.only(
                                bottom: screenSize(context).height * .015,
                                left: screenSize(context).width * .05,
                                right: screenSize(context).width * .05,
                                top: screenSize(context).height * .015),
                            child: DsText(
                                overflow: TextOverflow.visible,
                                text: data['description'],
                                style: subTitlePrimary.copyWith(
                                    fontWeight: FontWeight.w400))),
                        const Divider(thickness: 1),
                        Container(
                            margin: EdgeInsets.only(
                                bottom: screenSize(context).height * .01,
                                top: screenSize(context).height * .01),
                            child: DsText(
                                text: 'PRINCIPAIS PONTOS TURÍSTICOS',
                                style: h7Primary.copyWith(
                                    fontWeight: FontWeight.w500))),
                        GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: footerheight),
                            childAspectRatio: 10 / 12.5,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            children:
                                List.generate(data['places'].length, (index) {
                              return Container(
                                  margin: EdgeInsets.only(
                                      bottom: screenSize(context).height * .015,
                                      left: screenSize(context).width * .025,
                                      right: screenSize(context).width * .025,
                                      top: screenSize(context).height * .015),
                                  child: Column(children: [
                                    AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                                data['places'][index]['img'],
                                                fit: BoxFit.cover))),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: screenSize(context).height *
                                                .01),
                                        child: DsText(
                                            maxLines: 1,
                                            text: data['places'][index]['name'],
                                            style: subTitlePrimary)),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: screenSize(context).height *
                                                .005),
                                        child: const DsText(
                                            text: 'Ponto Turístico',
                                            style: textCard))
                                  ]));
                            }))
                      ]))
                ]),
            Container(
                height: screenSize(context).width * .05,
                margin: EdgeInsets.only(top: statusBarHeight),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () => backButtonAction(context)))
          ]),
        ),
      );
    });
  }
}
