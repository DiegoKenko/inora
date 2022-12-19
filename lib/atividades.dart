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
        horizontal: ratioVertical ? 0.1 : responsiveWidth * 0.1,
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
              (e) => CardAtividades(
                  ratioVertical: ratioVertical,
                  responsiveWidth: responsiveWidth,
                  responsiveHeight: responsiveHeight,
                  atividades: e),
            )
            .toList(),
      ),
    );
  }
}

class CardAtividades extends StatelessWidget {
  const CardAtividades({
    Key? key,
    required this.ratioVertical,
    required this.responsiveWidth,
    required this.responsiveHeight,
    required this.atividades,
  }) : super(key: key);

  final bool ratioVertical;
  final double responsiveWidth;
  final double responsiveHeight;
  final Map<String, dynamic> atividades;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ratioVertical ? 0.02 : responsiveWidth * 0.1,
        vertical:
            ratioVertical ? responsiveHeight * 0.02 : responsiveWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flex(
            direction: ratioVertical ? Axis.vertical : Axis.horizontal,
            children: [
              Image.asset(
                atividades['imagem'],
                width: ratioVertical
                    ? responsiveWidth * 0.5
                    : responsiveWidth * 0.2,
                height: ratioVertical
                    ? responsiveHeight * 0.3
                    : responsiveHeight * 0.15,
              ),
              ratioVertical
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: responsiveHeight * 0.01,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: responsiveWidth * 0.08,
                            ),
                            child: Text(
                              atividades['nome'],
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: ratioVertical
                                  ? kTextStyleTitleBlackVertical
                                  : kTextStyleTitleBlackLarge,
                            ),
                          ),
                          Topicos(topicos: atividades['topicos']),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: responsiveWidth * 0.03,
                            ),
                            child: Text(
                              atividades['nome'],
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: kTextStyleTitleBlackLarge,
                            ),
                          ),
                          Topicos(topicos: atividades['topicos']),
                        ],
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class Topicos extends StatelessWidget {
  const Topicos({
    Key? key,
    required this.topicos,
  }) : super(key: key);

  final List<String> topicos;

  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: topicos.map(
        (String e) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                    size: ratioVertical ? 28 : 40,
                  ),
                ),
                Expanded(
                  child: Text(
                    e,
                    style: ratioVertical ? kTextTopicVertical : kTextTopic,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
