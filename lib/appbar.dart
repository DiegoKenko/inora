import 'package:flutter/material.dart';
import 'package:inora/styles.dart';

class InoraAppBar extends StatelessWidget with PreferredSizeWidget {
  const InoraAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return AppBar(
      automaticallyImplyLeading: ratioVertical ? true : false,
      backgroundColor: kBlack,
      centerTitle: ratioVertical ? false : true,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        child: Flex(
          direction: ratioVertical ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text(
                'INORA',
                style: kTextStyleTitleOrangeLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveWidth * 0.01),
              child: Text(
                ' ( em construção ) ',
                style: kTextStyleObsOrange,
              ),
            ),
          ],
        ),
      ),
      actions: [
        !ratioVertical
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsiveWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth * 0.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/contato');
                        },
                        child: Center(
                          child: Text('Contato',
                              style: kTextStyleSubTitleHeaderOrange),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth * 0.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/parceiros');
                        },
                        child: Center(
                          child: Text('Parceiros',
                              style: kTextStyleSubTitleHeaderOrange),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth * 0.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/trabalhe_conosco');
                        },
                        child: Center(
                          child: Text('Trabalhe conosco',
                              style: kTextStyleSubTitleHeaderOrange),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
