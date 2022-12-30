import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DiegoTabProfile extends StatelessWidget {
  const DiegoTabProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Container(
      padding: ratioVertical
          ? EdgeInsets.symmetric(
              horizontal: responsiveWidth * 0.02,
              vertical: responsiveHeight * 0.02)
          : EdgeInsets.symmetric(
              horizontal: responsiveWidth * 0.02,
              vertical: responsiveHeight * 0.02,
            ),
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 2,
        ),
        color: kBlack.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: Stack(
          children: [
            DiegoProfile(
              responsiveHeight: responsiveHeight,
              responsiveWidth: responsiveWidth,
              ratioVertical: ratioVertical,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.arrow_drop_down,
                size: ratioVertical ? 40 : 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiegoProfile extends StatelessWidget {
  const DiegoProfile({
    Key? key,
    required this.responsiveHeight,
    required this.responsiveWidth,
    required this.ratioVertical,
  }) : super(key: key);

  final double responsiveHeight;
  final double responsiveWidth;
  final bool ratioVertical;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flex(
          direction: ratioVertical ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: ratioVertical
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset(
                imagens['diego']!,
                height: responsiveHeight * 0.2,
                width: ratioVertical
                    ? responsiveWidth * 0.4
                    : responsiveWidth * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: SelectableText(
                    'Diego Andrade Fernandino Lopes',
                    style: ratioVertical
                        ? kTextProfileTitleVertical
                        : kTextProfileTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: SelectableText(
                    'Engenheiro de Software ',
                    style: ratioVertical
                        ? kTextProfileSubTitleVertical
                        : kTextProfileSubTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: SelectableText(
                    '19/01/1998 - Sete Lagoas - MG - Brazil',
                    style: ratioVertical
                        ? kTextProfileSubTitleVertical
                        : kTextProfileSubTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: SelectableText(
                    '+55 31 994-510-099',
                    style: ratioVertical
                        ? kTextProfileSubTitleVertical
                        : kTextProfileSubTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: SelectableText(
                    'diegoandrade@inora.com.br',
                    style: ratioVertical
                        ? kTextProfileSubTitleVertical
                        : kTextProfileSubTitle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.instagram),
                      onPressed: () {
                        launchUrl(
                          Uri.http('www.instagram.com', 'dafl_andrade'),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.github),
                      onPressed: () {
                        launchUrl(
                          Uri.http('www.github.com', 'DiegoKenko'),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.linkedin),
                      onPressed: () {
                        launchUrl(
                          Uri.http(
                            'www.linkedin.com',
                            'in/diego-andrade-4b40061b8',
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.twitter),
                      onPressed: () {
                        launchUrl(
                          Uri.http(
                            'twitter.com',
                            'DiegoAn19358807',
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
