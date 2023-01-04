import 'package:flutter/material.dart';
import 'package:inora/mock.dart';
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
          Navigator.pushNamed(context, '/home');
        },
        child: Container(
          width: double.infinity,
          height: responsiveHeight * 0.07,
          color: kWhite,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imagens['inora_logo_black']!,
                      height: responsiveHeight * 0.05,
                    ),
                  ),
                  Text(
                    '© 2023 INORA Softwares Ltda.',
                    style: ratioVertical
                        ? kTextStyleFooterBlackVertical
                        : kTextStyleFooterBlack,
                  ),
                ],
              ),
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
    path0.moveTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width, 0, size.width * 0.9, 0);
    path0.lineTo(size.width * 0.1, 0);
    path0.quadraticBezierTo(0, 0, 0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
