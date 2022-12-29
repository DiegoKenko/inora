import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inora/appbar.dart';
import 'package:inora/drawer.dart';
import 'package:inora/footer.dart';
import 'package:inora/mock.dart';
import 'package:inora/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class Diego extends StatefulWidget {
  const Diego({Key? key}) : super(key: key);

  @override
  State<Diego> createState() => _DiegoState();
}

class _DiegoState extends State<Diego> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: ratioVertical
                    ? EdgeInsets.symmetric(
                        horizontal: responsiveWidth * 0.02,
                        vertical: responsiveHeight * 0.02)
                    : EdgeInsets.symmetric(
                        horizontal: responsiveWidth * 0.02,
                        vertical: responsiveHeight * 0.02,
                      ),
                child: Row(
                  children: [
                    Container(
                      padding: ratioVertical
                          ? EdgeInsets.symmetric(
                              horizontal: responsiveWidth * 0.02)
                          : EdgeInsets.symmetric(
                              horizontal: responsiveWidth * 0.02),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TabBar(
                            enableFeedback: true,
                            indicator: BoxDecoration(
                              color: kBlack.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            labelColor: kWhite,
                            unselectedLabelColor: kBlack,
                            controller: tabController,
                            tabs: [
                              const DiegoTab(icon: Icon(Icons.person)),
                              const DiegoTab(icon: Icon(Icons.computer)),
                              const DiegoTab(icon: Icon(Icons.work)),
                              const DiegoTab(
                                  icon: Icon(Icons.outlined_flag_outlined)),
                              const DiegoTab(icon: Icon(Icons.add_reaction)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            const DiegoTabProfile(),
                            const DiegoTabSkills(),
                            const DiegoTabCareer(),
                            const DiegoTabAccomplishment(),
                            const DiegoTabHobby(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const InoraFooter()
          ],
        ),
      ),
      drawer: const InoraDrawer(),
    );
  }
}

class DiegoTabAccomplishment extends StatelessWidget {
  const DiegoTabAccomplishment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 2,
        ),
        color: kBlack.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}

class DiegoTabCareer extends StatelessWidget {
  const DiegoTabCareer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 2,
        ),
        color: kBlack.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}

class DiegoTabSkills extends StatelessWidget {
  const DiegoTabSkills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 2,
        ),
        color: kBlack.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}

class DiegoTabProfile extends StatelessWidget {
  const DiegoTabProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Container(
      padding: ratioVertical
          ? EdgeInsets.symmetric(
              horizontal: responsiveWidth * 0.02,
              vertical: responsiveHeight * 0.02)
          : EdgeInsets.symmetric(
              horizontal: responsiveWidth * 0.02,
              vertical: responsiveHeight * 0.02,
            ),
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 2,
        ),
        color: kBlack.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: DiegoProfile(
          responsiveHeight: responsiveHeight,
          responsiveWidth: responsiveWidth,
          ratioVertical: ratioVertical,
        ),
      ),
    );
  }
}

class DiegoProfile extends StatelessWidget {
  const DiegoProfile({
    Key? key,
    required this.responsiveHeight,
    required this.responsiveWidth,
    required this.ratioVertical,
  }) : super(key: key);

  final double responsiveHeight;
  final double responsiveWidth;
  final bool ratioVertical;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flex(
          direction: ratioVertical ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: ratioVertical
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset(
                imagens['diego']!,
                height: responsiveHeight * 0.2,
                width: ratioVertical
                    ? responsiveWidth * 0.4
                    : responsiveWidth * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: Text(
                    'Diego Andrade Fernandino Lopes',
                    style: ratioVertical
                        ? kTextProfileTitleVertical
                        : kTextProfileTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: Text(
                    'Engenheiro de Software ',
                    style: ratioVertical
                        ? kTextProfileSubTitleVertical
                        : kTextProfileSubTitle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth * 0.02,
                    vertical: responsiveHeight * 0.01,
                  ),
                  child: Text(
                    '19/01/1998 - Sete Lagoas - MG - Brasil',
                    style: ratioVertical
                        ? kTextProfileSubTitleVertical
                        : kTextProfileSubTitle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.instagram),
                      onPressed: () {
                        launchUrl(
                          Uri.http('www.instagram.com', 'dafl_andrade'),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.github),
                      onPressed: () {
                        launchUrl(
                          Uri.http('www.github.com', 'DiegoKenko'),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.linkedin),
                      onPressed: () {
                        launchUrl(
                          Uri.http(
                            'www.linkedin.com',
                            'in/diego-andrade-4b40061b8',
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.twitter),
                      onPressed: () {
                        launchUrl(
                          Uri.http(
                            'twitter.com',
                            'DiegoAn19358807',
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class DiegoTabHobby extends StatelessWidget {
  const DiegoTabHobby({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    bool ratioVertical = responsiveHeight > responsiveWidth;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
          width: 2,
        ),
        color: kBlack.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}

class DiegoTab extends StatelessWidget {
  const DiegoTab({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: RotatedBox(
        quarterTurns: 3,
        child: icon,
      ),
    );
  }
}
