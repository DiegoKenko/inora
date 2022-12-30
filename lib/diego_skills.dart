import 'package:flutter/material.dart';
import 'package:inora/componentes.dart';
import 'package:inora/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiegoTabSkills extends StatelessWidget {
  const DiegoTabSkills({
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
            DiegoSkill(
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

class DiegoSkill extends StatelessWidget {
  const DiegoSkill({
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
    return Container(
      padding: ratioVertical
          ? EdgeInsets.symmetric(
              horizontal: responsiveWidth * 0.02,
            )
          : EdgeInsets.symmetric(
              horizontal: responsiveWidth * 0.2,
            ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectableText(
              AppLocalizations.of(context).conhecimento.toUpperCase(),
              style:
                  ratioVertical ? kTextProfileTitleVertical : kTextProfileTitle,
            ),
            AgrupadorLabel(
              ratioVertical: ratioVertical,
              label: AppLocalizations.of(context).idiomas,
              children: [
                SelectableText(
                  '${AppLocalizations.of(context).portugues.toUpperCase()} - ${AppLocalizations.of(context).nativo}',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  '${AppLocalizations.of(context).ingles.toUpperCase()} - ${AppLocalizations.of(context).proeficinciaprofissional}',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  '${AppLocalizations.of(context).alemao.toUpperCase()} - ${AppLocalizations.of(context).basico}',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
              ],
            ),
            AgrupadorLabel(
              ratioVertical: ratioVertical,
              label:
                  '${AppLocalizations.of(context).linguagensprogramacao.toUpperCase()} / Frameworks',
              children: [
                SelectableText(
                  'Dart / Flutter',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'JavaScript / HTML / CSS',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'Python',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'SQL',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'Advpl / TL++ ',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
              ],
            ),
            AgrupadorLabel(
              ratioVertical: ratioVertical,
              label: AppLocalizations.of(context).ferramentas,
              children: [
                SelectableText(
                  'Firebase',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'Google Cloud Platforms',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'Scrum ',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'Modelagem de dados',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'Git',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'VMWare',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'VSCode',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'TOTVS Protheus',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
                SelectableText(
                  'SQL Server',
                  style: ratioVertical
                      ? kTextProfileSubTitleVertical
                      : kTextProfileSubTitle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
