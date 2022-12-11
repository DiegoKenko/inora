// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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

    return SingleChildScrollView(
      scrollDirection: ratioVertical ? Axis.vertical : Axis.horizontal,
      child: ratioVertical
          ? Column(
              children: parceiros
                  .map(
                    (e) => cardParceiro(
                      ratioVertical,
                      responsiveWidth,
                      responsiveHeight,
                      e,
                    ),
                  )
                  .toList(),
            )
          : Row(
              children: parceiros
                  .map(
                    (e) => cardParceiro(
                      ratioVertical,
                      responsiveWidth,
                      responsiveHeight,
                      e,
                    ),
                  )
                  .toList(),
            ),
    );
  }

  Widget cardParceiro(bool ratioVertical, double responsiveWidth,
      double responsiveHeight, List<String> parceiro) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ratioVertical ? 0.1 : responsiveWidth * 0.02,
      ),
      width: ratioVertical ? double.infinity : responsiveWidth * 0.4,
      height: responsiveHeight * 0.1,
      child: Card(
        elevation: 10,
        shadowColor: kPrimaryColor.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kPrimaryColor, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              parceiro[0],
              style: kTextStyleSubTitleBlack,
            ),
            Text(
              parceiro[1],
              style: kTextStyleSubTitleBlack,
            ),
          ],
        ),
      ),
    );
  }
}
