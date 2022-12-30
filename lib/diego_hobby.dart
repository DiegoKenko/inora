import 'package:flutter/material.dart';
import 'package:inora/styles.dart';

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
