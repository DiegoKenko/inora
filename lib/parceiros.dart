// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inora/appbar.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';

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
      appBar: InoraAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InoraHeader(),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: responsiveHeight * 0.4,
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
                      height: responsiveHeight * 0.3,
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
  final List<String> parceiro;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveWidth * 0.15,
      margin: EdgeInsets.symmetric(
        vertical: responsiveHeight * 0.025,
        horizontal: responsiveWidth * 0.025,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 1,
        ),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'xxx',
            style: kTextStyleSubTitleBlack,
          ),
        ],
      ),
    );
  }
}
