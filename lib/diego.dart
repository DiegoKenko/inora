import 'package:flutter/material.dart';
import 'package:inora/diego_profile.dart';
import 'package:inora/diego_skills.dart';
import 'package:inora/diego_career.dart';
import 'package:inora/diego_hobby.dart';
import 'package:inora/drawer.dart';
import 'package:inora/footer.dart';
import 'package:inora/styles.dart';

class Diego extends StatefulWidget {
  const Diego({Key? key}) : super(key: key);

  @override
  State<Diego> createState() => _DiegoState();
}

class _DiegoState extends State<Diego> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
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
                child: Builder(builder: (context) {
                  return Row(
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
                              tabs: const [
                                DiegoTab(icon: Icon(Icons.person)),
                                DiegoTab(icon: Icon(Icons.computer)),
                                DiegoTab(icon: Icon(Icons.work)),
                                //  const DiegoTab(icon: Icon(Icons.outlined_flag_outlined)),
                                DiegoTab(icon: Icon(Icons.add_reaction)),
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
                            children: const [
                              DiegoTabProfile(),
                              DiegoTabSkills(),
                              DiegoTabCareer(),
                              // const DiegoTabAccomplishment(),
                              DiegoTabHobby(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
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
