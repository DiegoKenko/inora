// ignore_for_file: unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:inora/styles.dart';
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
      return ClipPath(
        clipper: HeaderClipper(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: kHeaderGrey,
              height: responsiveHeight * 0.5,
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
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: kBlack,
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: kWhite,
        child: ClipPath(
          clipper: HeaderClipper(),
          child: Column(
            children: [
              Container(
                color: kHeaderGrey,
                child: Center(
                  child: Image.asset(
                    'assets/appTrans.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: kBlack,
              ),
            ],
          ),
        ),
      );
    }
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.0028571);
    path0.quadraticBezierTo(size.width * 0.0310417, size.height * 0.8350000,
        size.width * 0.0683333, size.height * 0.8528571);
    path0.cubicTo(
        size.width * 0.0893750,
        size.height * 0.9478571,
        size.width * 0.8850000,
        size.height * 0.8664286,
        size.width * 0.9025000,
        size.height * 0.8000000);
    path0.quadraticBezierTo(size.width * 0.9672917, size.height * 0.7792857,
        size.width * 0.9991667, size.height * 0.0014286);
    path0.lineTo(size.width * 0.0008333, size.height * 0.0028571);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
