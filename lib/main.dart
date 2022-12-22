// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inora/appbar.dart';
import 'package:inora/atividades.dart';
import 'package:inora/contato.dart';
import 'package:inora/firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inora/footer.dart';
import 'package:inora/header.dart';
import 'package:inora/parceiros.dart';
import 'package:inora/styles.dart';
import 'package:inora/trabalhe_conosco.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/contato': (BuildContext context) => InoraContato(),
        '/parceiros': (BuildContext context) => InoraParceiros(),
        '/trabalhe_conosco': (BuildContext context) => InoraTrabalheConosco(),
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
        cardColor: Colors.white,
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Scaffold(
      drawer: ratioVertical ? Drawer() : null,
      appBar: InoraAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              InoraHeader(),
              InoraAtividades(),
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
        vertical: responsiveHeight * 0.02,
      ),
      width: double.infinity,
      height: ratioVertical ? responsiveHeight * 0.5 : responsiveHeight * 0.2,
      color: kWhite,
      child: Flex(
        direction: ratioVertical ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Casos de sucesso',
                      style: kTextStyleSubTitleBlack,
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight * 0.01,
                  ),
                  Text(
                    'Os participantes do ecossistema da Inora que são referência no mercado.',
                    style: kTextStyleDescriptionBlack,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/parceiros');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.05,
                    vertical: responsiveHeight * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Conheça nossos parceiros',
                    style: kTextStyleSubTitleBlack,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InoraDivider extends StatefulWidget {
  const InoraDivider({
    Key? key,
  }) : super(key: key);

  @override
  State<InoraDivider> createState() => _InoraDividerState();
}

class _InoraDividerState extends State<InoraDivider>
    with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(seconds: 2);
  late Animation _colorTween;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 30,
      ),
    )..repeat();

    _colorTween = ColorTween(
      begin: kPrimaryColor,
      end: kPrimaryColor.withOpacity(0.1),
    ).animate(
      _animationController,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.025,
          ),
          height: MediaQuery.of(context).size.height * 0.005,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _colorTween.value,
                Colors.white,
              ],
            ),
          ),
        );
      },
    );
  }
}
