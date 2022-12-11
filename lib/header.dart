// ignore_for_file: unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:responsive_styles/responsive_styles.dart';

class InoraHeader extends StatefulWidget {
  const InoraHeader({Key? key}) : super(key: key);

  @override
  State<InoraHeader> createState() => _InoraHeaderState();
}

class _InoraHeaderState extends State<InoraHeader> {
  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    if (!ratioVertical) {
      return Container(
        width: double.infinity,
        color: Color(0xFFF0EFEF),
        height: responsiveHeight * 0.4,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Positioned(
                    child: Row(),
                    top: responsiveHeight * 0.1,
                    left: responsiveWidth * 0.1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Image.asset(
                  'assets/appTrans.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: Color(0xFFF0EFEF),
        child: Center(
          child: Image.asset(
            'assets/appTrans.gif',
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
