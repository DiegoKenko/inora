import 'package:flutter/material.dart';
import 'package:inora/styles.dart';

class DiegoTabAccomplishment extends StatelessWidget {
  const DiegoTabAccomplishment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
