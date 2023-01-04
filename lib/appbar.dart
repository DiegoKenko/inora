import 'package:flutter/material.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                          Navigator.pushNamed(context, '/contato');
                        },
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).contato,
                            style: kTextStyleSubTitleHeaderOrange,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth * 0.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/trabalhe_conosco');
                        },
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).trabalheconosco,
                            style: kTextStyleSubTitleHeaderOrange,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth * 0.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Image.asset(
                          fit: BoxFit.contain,
                          imagens['inora_logo_white']!,
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
