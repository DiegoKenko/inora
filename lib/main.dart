// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inora/firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inora/styles.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Inora());
}

class Inora extends StatefulWidget {
  const Inora({super.key});

  @override
  State<Inora> createState() => _InoraState();
}

class _InoraState extends State<Inora> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyScrollBehavior(),
      title: 'INORA',
      theme: ThemeData(
        fontFamily: GoogleFonts.raleway().fontFamily,
        textTheme: TextTheme(),
        primarySwatch: MaterialColor(0xFFF2650A, {
          50: Color(0x22F2650A),
          100: Color(0x44F2650A),
          200: Color(0x66F2650A),
          300: Color(0x77F2650A),
          400: Color(0x88F2650A),
          500: Color(0x99F2650A),
          600: Color(0xAAF2650A),
          700: Color(0xBBF2650A),
          800: Color(0xDDF2650A),
          900: Color(0xFFF2650A),
        }),
        cardColor: Colors.white,
      ),
      home: const Home(),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<bool> hover = [false, false, false];
  Image image = const Image(image: NetworkImage(''));
  final double itemMaxWidth = 600;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: header(),
        preferredSize: Size.fromHeight(100),
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                atividades(context),
                parceiros(context),
                footer(context),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget footer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.6),
            Theme.of(context).primaryColor.withOpacity(0.2),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Opacity(
        opacity: 0.7,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Desenvolvido por ',
                style: kTextStyleSubTitleBlack,
              ),
              Text(
                'Inora',
                style: kTextStyleSubTitleBlack,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget parceiros(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.15,
        ),
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Center(
                child: Text(
                  'NOSSOS PARCEIROS',
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.05,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                          bottom: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'EMPRESA $i',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardAtividade(BuildContext context, Widget child) {
    return Card(
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      child: Container(
        child: child,
      ),
    );
  }

  Widget atividades(BuildContext context) {
    return ClipPath(
      clipper: AtividadesClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'O QUE PODEMOS FAZER POR VOCÊ:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: MediaQuery.of(context).size.width > itemMaxWidth
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  cardAtividade(
                    context,
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'DESENVOLVIMENTO DE ',
                                children: [
                                  TextSpan(
                                      text: 'WEBSITES',
                                      style: kTextStyleTitleOrange)
                                ],
                                style: kTextStyleTitleBlack,
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: kTextStyleSubTitleBlack,
                                text:
                                    'Tenha um site profissional para sua empresa.',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  cardAtividade(
                    context,
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'DESENVOLVIMENTO DE ',
                                children: [
                                  TextSpan(
                                    text: 'APPS',
                                    style: kTextStyleTitleOrange,
                                  )
                                ],
                                style: kTextStyleTitleBlack,
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: kTextStyleSubTitleBlack,
                                text:
                                    'A solução dos seus problemas na palma da sua mão.',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  cardAtividade(
                    context,
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'TOTVS - PROTHEUS',
                                  style: kTextStyleTitleBlack),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Soluções personalizadas para o\n',
                                      style: kTextStyleSubTitleBlack),
                                  TextSpan(
                                      text: ' ERP PROTHEUS ',
                                      style: kTextStyleSubTitleorange),
                                  TextSpan(
                                    style: kTextStyleSubTitleBlack,
                                    text: 'da sua empresa.',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.05,
            child: Text('INORA'),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.height * 0.1,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
                text: 'MENSAGEM',
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onHover: ((value) {
                      setState(() {
                        hover[0] = value;
                      });
                    }),
                    child: Text(
                      'INICIO',
                      style: TextStyle(
                        color: hover[0] ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onHover: ((value) {
                      setState(() {
                        hover[1] = value;
                      });
                    }),
                    child: Text(
                      'CONTATO',
                      style: TextStyle(
                        color: hover[1] ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onHover: ((value) {
                      setState(() {
                        hover[2] = value;
                      });
                    }),
                    child: Text(
                      'ÁREA DO CLIENTE',
                      style: TextStyle(
                        color: hover[2] ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.4271429);
    path0.quadraticBezierTo(size.width * 0.1031250, size.height * 0.5696429,
        size.width * 0.2108333, size.height * 0.4285714);
    path0.cubicTo(
        size.width * 0.2672917,
        size.height * 0.3489286,
        size.width * 0.3225000,
        size.height * 0.3146429,
        size.width * 0.4166667,
        size.height * 0.4300000);
    path0.cubicTo(
        size.width * 0.5258333,
        size.height * 0.5560714,
        size.width * 0.5289583,
        size.height * 0.5517857,
        size.width * 0.6241667,
        size.height * 0.4285714);
    path0.cubicTo(
        size.width * 0.6958333,
        size.height * 0.3225000,
        size.width * 0.7591667,
        size.height * 0.3175000,
        size.width * 0.8341667,
        size.height * 0.4328571);
    path0.quadraticBezierTo(size.width * 0.9202083, size.height * 0.5785714,
        size.width * 0.9983333, size.height * 0.4271429);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ParceirosClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height * 0.8);
    path0.lineTo(size.width, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height,
        size.width,
        size.height * 0.8,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class AtividadesClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height,
        size.width,
        size.height * 0.8,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
