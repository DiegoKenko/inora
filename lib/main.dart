// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inora/firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
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
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          headline5: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          subtitle1: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          subtitle2: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          button: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          caption: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          overline: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: MediaQuery.of(context).size.height * 0.1,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            backgroundColor: Colors.white,
            flexibleSpace: header(),
          ),
          SliverPinnedHeader(
            child: atividades(context),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
      height: MediaQuery.of(context).size.height * 0.1,
      child: Opacity(
        opacity: 0.7,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Desenvolvido por ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const Text(
                'Inora',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget parceiros(BuildContext context) {
    return ClipPath(
      clipper: ParceirosClipper(),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.15,
        ),
        height: MediaQuery.of(context).size.height * 0.7,
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
                  height: MediaQuery.of(context).size.height * 0.3),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
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
                          style: TextStyle(fontSize: 16.0),
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

  Widget atividades(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
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
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DESENVOLVIMENTO DE WEBSITES',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                              text:
                                  'Tenha um site profissional para sua empresa.',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DESENVOLVIMENTO DE APLICATIVOS MÓVEIS',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                              text:
                                  'A solução dos seus problemas na palma da sua mão.',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orange[200]!,
                    Colors.orange,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.05,
            child: Text('INORA'),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.height * 0.25,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
                text: 'UMA MENSAGEM BACANA AQUI',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Positioned(
                top: 20,
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
    path0.lineTo(size.width, size.height * 0.8657143);
    path0.lineTo(size.width, size.height * 0.1500000);
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
