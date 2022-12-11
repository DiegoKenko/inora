import 'package:flutter/material.dart';
import 'package:inora/styles.dart';

class InoraFooter extends StatefulWidget {
  InoraFooter({Key? key}) : super(key: key);

  @override
  State<InoraFooter> createState() => _InoraFooterState();
}

class _InoraFooterState extends State<InoraFooter> {
  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    return Container(
      width: double.infinity,
      height: responsiveHeight * 0.07,
      color: kPrimaryColor,
    );
  }
}
