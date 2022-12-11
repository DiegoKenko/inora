// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unused_import

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';

class InoraAtividades extends StatefulWidget {
  InoraAtividades({Key? key}) : super(key: key);

  @override
  State<InoraAtividades> createState() => InoraAtividadesState();
}

class InoraAtividadesState extends State<InoraAtividades> {
  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: ratioVertical ? responsiveHeight * 0.05 : 0.15,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 0, 138, 180).withOpacity(0.7),
            Color.fromARGB(255, 0, 138, 180).withOpacity(0.3),
          ],
        ),
      ),
      child: Column(
        children: atividades
            .map(
              (e) => cardAtividades(
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

  Widget cardAtividades(bool ratioVertical, double responsiveWidth,
      double responsiveHeight, List<String> atividades) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ratioVertical ? 0.1 : responsiveWidth * 0.1,
        vertical:
            ratioVertical ? responsiveHeight * 0.05 : responsiveWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flex(
            direction: ratioVertical ? Axis.vertical : Axis.horizontal,
            children: [
              Image.asset(
                atividades[2],
                width: ratioVertical
                    ? responsiveWidth * 0.5
                    : responsiveWidth * 0.2,
                height: ratioVertical
                    ? responsiveHeight * 0.3
                    : responsiveHeight * 0.15,
              ),
              ratioVertical
                  ? Text(
                      atividades[0],
                      style: kTextStyleSubTitleBlack,
                    )
                  : Expanded(
                      child: Column(
                        children: [
                          Text(
                            atividades[0],
                            style: kTextStyleTitleBlackLarge,
                          ),
                          Text(
                            atividades[1],
                            style: kTextStyleTitleBlackLarge,
                          ),
                        ],
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
