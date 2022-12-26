// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inora/appbar.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class InoraParceiros extends StatefulWidget {
  InoraParceiros({Key? key}) : super(key: key);

  @override
  State<InoraParceiros> createState() => InoraParceirosState();
}

class InoraParceirosState extends State<InoraParceiros> {
  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InoraHeader(),
              Container(
                color: kWhite,
                width: double.infinity,
                height: responsiveHeight * 0.7,
                padding: EdgeInsets.only(
                  top: responsiveHeight * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth * 0.05,
                      ),
                      child: Text(
                        'PARCEIROS',
                        style: ratioVertical
                            ? kTextStyleTitleOrangeVertical
                            : kTextStyleTitleOrangeLarge,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth * 0.05,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection:
                              ratioVertical ? Axis.vertical : Axis.horizontal,
                          child: ratioVertical
                              ? Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: parceiros
                                      .map(
                                        (e) => CardParceiro(
                                            ratioVertical: ratioVertical,
                                            responsiveWidth: responsiveWidth,
                                            responsiveHeight: responsiveHeight,
                                            parceiro: e),
                                      )
                                      .toList(),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: parceiros
                                      .map(
                                        (e) => CardParceiro(
                                            ratioVertical: ratioVertical,
                                            responsiveWidth: responsiveWidth,
                                            responsiveHeight: responsiveHeight,
                                            parceiro: e),
                                      )
                                      .toList(),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InoraFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardParceiro extends StatelessWidget {
  const CardParceiro({
    Key? key,
    required this.ratioVertical,
    required this.responsiveWidth,
    required this.responsiveHeight,
    required this.parceiro,
  }) : super(key: key);

  final bool ratioVertical;
  final double responsiveWidth;
  final double responsiveHeight;
  final List<dynamic> parceiro;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveWidth * 0.15,
      width: ratioVertical ? responsiveWidth * 0.8 : responsiveWidth * 0.1,
      margin: EdgeInsets.symmetric(
        vertical: responsiveHeight * 0.025,
        horizontal: responsiveWidth * 0.025,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: InkWell(
          onTap: () => launchUrl(parceiro[2]),
          child: Image.asset(
            parceiro[1],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
