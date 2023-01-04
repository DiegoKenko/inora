import 'package:flutter/material.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';

class InoraHeader extends StatefulWidget {
  const InoraHeader({Key? key}) : super(key: key);

  @override
  State<InoraHeader> createState() => _InoraHeaderState();
}

class _InoraHeaderState extends State<InoraHeader> {
  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    int pos = 0;
    List<String> switchers = [
      'Tecnologia',
      'Segurança',
      'Inovação',
      'Conhecimento',
      'Qualidade',
      'Transformação Digital',
      'Praticidade',
    ];

    if (ratioVertical) {
      return Container(
        color: kBlack,
        child: ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            color: kHeaderGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      imagens['inora_black']!,
                      height: responsiveHeight * 0.2,
                    ),
                  ),
                ),
                Text(
                  'Desenvolvendo softwares com: ',
                  style: kTextStyleSubTitleHeaderBlackVertical,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: responsiveHeight * 0.1,
                    left: responsiveWidth * 0.1,
                    right: responsiveWidth * 0.1,
                  ),
                  child: StreamBuilder(
                      stream:
                          Stream.periodic(const Duration(milliseconds: 1800)),
                      builder: (context, snapshot) {
                        pos++;
                        if (pos > switchers.length - 1) {
                          pos = 0;
                        }
                        return AnimatedSwitcher(
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                          duration: const Duration(milliseconds: 200),
                          child: Center(
                            child: Text(
                              switchers[pos],
                              style: kTextStyleTitleHeaderOrangeVertical,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: kBlack,
        child: ClipPath(
          clipper: HeaderClipper(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                color: kHeaderGrey,
                height: responsiveHeight * 0.5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            imagens['inora_black']!,
                            height: responsiveHeight * 0.2,
                          ),
                        ),
                      ),
                      Text('Desenvolvendo softwares com: ',
                          style: kTextStyleSubTitleHeaderBlack),
                      StreamBuilder(
                          stream: Stream.periodic(
                              const Duration(milliseconds: 1800)),
                          builder: (context, snapshot) {
                            pos++;
                            if (pos > switchers.length - 1) {
                              pos = 0;
                            }
                            return AnimatedSwitcher(
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                              duration: const Duration(milliseconds: 200),
                              child: Text(
                                switchers[pos],
                                style: kTextStyleTitleHeaderOrange,
                              ),
                            );
                          }),
                    ],
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
    Path path0 = Path();
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height * 0.95);
    path0.quadraticBezierTo(
        size.width, size.height, size.width, size.height * 0.9);
    path0.quadraticBezierTo(
        size.width * 0.5, size.height, 0, size.height * 0.9);
    path0.quadraticBezierTo(0, size.height * 0.95, 0, size.height * 0.05);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
