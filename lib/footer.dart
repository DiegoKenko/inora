import 'package:flutter/material.dart';
import 'package:inora/styles.dart';

class InoraFooter extends StatefulWidget {
  const InoraFooter({Key? key}) : super(key: key);

  @override
  State<InoraFooter> createState() => _InoraFooterState();
}

class _InoraFooterState extends State<InoraFooter> {
  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    return ClipPath(
      clipper: FooterClipper(),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Container(
          width: double.infinity,
          height: responsiveHeight * 0.07,
          color: kPrimaryColor,
          child: Center(
            child: Text(
              '© 2023 Inora Softwares Ltda.',
              style: ratioVertical
                  ? kTextStyleFooterBlackVertical
                  : kTextStyleFooterBlack,
            ),
          ),
        ),
      ),
    );
  }
}

class FooterClipper extends CustomClipper<Path> {
  Paint paint0 = Paint()
    ..color = const Color.fromARGB(255, 33, 150, 243)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height * 0.0446429,
        size.width * 0.9100000, size.height * 0.0557143);
    path0.cubicTo(
        size.width * 0.8529167,
        size.height * 0.0564286,
        size.width * 0.0504167,
        size.height * 0.0650000,
        size.width * 0.0491667,
        size.height * 0.1385714);
    path0.quadraticBezierTo(size.width * 0.0279167, size.height * 0.1182143,
        size.width * 0.0008333, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
