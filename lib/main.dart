// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_import

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inora/appbar.dart';
import 'package:inora/atividades.dart';
import 'package:inora/drawer.dart';
import 'package:inora/firebase/analytics.dart';
import 'package:inora/firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/contato.dart';
import 'package:inora/mock.dart';
import 'package:inora/diego.dart';
import 'package:inora/styles.dart';
import 'package:inora/trabalhe_conosco.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

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
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate, //
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', ''), // Portuguese, no country code
        Locale('en', ''), // English, no country code
      ],
      scrollBehavior: MyScrollBehavior(),
      title: 'INORA',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/contato': (BuildContext context) => InoraContato(),
        '/trabalhe_conosco': (BuildContext context) => InoraTrabalheConosco(),
        '/diego': (BuildContext context) => Diego(),
      },
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
        cardColor: kBlack,
      ),
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
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    return Scaffold(
      drawer: ratioVertical ? InoraDrawer() : null,
      appBar: InoraAppBar(),
      backgroundColor: kBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              InoraHeader(),
              InoraIdeiaPreview(),
              InoraAtividades(),
              InoraLemaPreview(),
              InoraParceirosPreview(),
              InoraFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class InoraParceirosPreview extends StatelessWidget {
  const InoraParceirosPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth * 0.1,
        vertical: responsiveHeight * 0.05,
      ),
      width: double.infinity,
      color: kBlack,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SelectableText(
                  AppLocalizations.of(context).cases,
                  style: kTextStyleSubTitleWhite,
                ),
              ),
              SizedBox(
                height: responsiveHeight * 0.02,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: AppLocalizations.of(context)
                              .osparticipantesdoecossistemada,
                          style: kTextStyleDescriptionWhite),
                      TextSpan(
                        text: 'INORA ',
                        style: kTextStyleDescriptionOrange,
                      ),
                      TextSpan(
                          text: AppLocalizations.of(context).quesaoreferencia,
                          style: kTextStyleDescriptionWhite),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: responsiveHeight * 0.1,
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection:
                      ratioVertical ? Axis.vertical : Axis.horizontal,
                  child: ratioVertical
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: parceiros
                              .map(
                                (e) => CardParceiro(
                                    ratioVertical: ratioVertical,
                                    responsiveWidth: responsiveWidth,
                                    responsiveHeight: responsiveHeight,
                                    parceiro: e),
                              )
                              .toList(),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: parceiros
                              .map(
                                (e) => CardParceiro(
                                    ratioVertical: ratioVertical,
                                    responsiveWidth: responsiveWidth,
                                    responsiveHeight: responsiveHeight,
                                    parceiro: e),
                              )
                              .toList(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InoraIdeiaPreview extends StatelessWidget {
  const InoraIdeiaPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth * 0.15,
            vertical: responsiveHeight * 0.01,
          ),
          width: double.infinity,
          height: ratioVertical
              ? responsiveHeight * 0.7
              : responsiveHeight * 0.2 > 300
                  ? responsiveHeight * 0.2
                  : 300,
          color: kBlack,
          child: Flex(
            direction: ratioVertical ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SelectableText(
                          AppLocalizations.of(context).temumaideia,
                          style: kTextStyleSubTitleWhite,
                        ),
                      ),
                      SizedBox(
                        height: responsiveHeight * 0.01,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '\n ${AppLocalizations.of(context).a}',
                              style: kTextStyleDescriptionWhite,
                            ),
                            TextSpan(
                              text: 'INORA ',
                              style: kTextStyleDescriptionOrange,
                            ),
                            TextSpan(
                              text: AppLocalizations.of(context).lema,
                              style: kTextStyleDescriptionWhite,
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/contato');
                  },
                  splashColor: kPrimaryColor,
                  hoverColor: kBlack,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth * 0.01,
                      vertical: responsiveHeight * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      AppLocalizations.of(context).entreemcontato,
                      style: ratioVertical
                          ? kTextStyleSubTitleWhiteVertical
                          : kTextStyleSubTitleWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InoraLemaPreview extends StatelessWidget {
  const InoraLemaPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return ClipPath(
      clipper: LemaClipper(),
      child: SizedBox(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth * 0.15,
            vertical: responsiveHeight * 0.02,
          ),
          width: double.infinity,
          height: ratioVertical
              ? responsiveHeight
              : responsiveHeight * 0.6 > 600
                  ? responsiveHeight * 0.6
                  : 600,
          color: kPrimaryColor,
          child: Flex(
            direction: ratioVertical ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: responsiveHeight * 0.05),
                        child: Center(
                          child: SelectableText(
                            AppLocalizations.of(context).sobrenos,
                            style: kTextStyleTitleWhite,
                          ),
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '\n\n\n${AppLocalizations.of(context).inorahistoryideia}',
                                style: kTextStyleDescriptionWhite,
                              ),
                              TextSpan(
                                text:
                                    '\n\n\n${AppLocalizations.of(context).inorahistorycrenca}',
                                style: kTextStyleDescriptionWhite,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LemaClipper extends CustomClipper<Path> {
  Paint paint0 = Paint()
    ..color = const Color.fromARGB(255, 33, 150, 243)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.05);
    path0.quadraticBezierTo(
        size.width * 0.5, 0, size.width, size.height * 0.05);
    path0.quadraticBezierTo(
        size.width, size.height * 0.75, size.width, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CardParceiro extends StatelessWidget {
  const CardParceiro({
    Key? key,
    required this.ratioVertical,
    required this.responsiveWidth,
    required this.responsiveHeight,
    required this.parceiro,
  }) : super(key: key);

  final bool ratioVertical;
  final double responsiveWidth;
  final double responsiveHeight;
  final List<dynamic> parceiro;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(parceiro[2]),
      child: Center(
        child: Container(
          height:
              ratioVertical ? responsiveHeight * 0.15 : responsiveHeight * 0.1,
          width: ratioVertical ? responsiveWidth * 0.6 : responsiveWidth * 0.1,
          margin: EdgeInsets.symmetric(
            vertical: responsiveHeight * 0.01,
            horizontal: responsiveWidth * 0.01,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image.asset(
            parceiro[1],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
