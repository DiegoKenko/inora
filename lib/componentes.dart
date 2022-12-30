import 'package:flutter/material.dart';
import 'package:inora/styles.dart';

class AgrupadorLabel extends StatelessWidget {
  const AgrupadorLabel({
    Key? key,
    required this.ratioVertical,
    required this.label,
    required this.children,
  }) : super(key: key);

  final bool ratioVertical;
  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label.toUpperCase(),
          labelStyle: ratioVertical
              ? kTextProfileSubTitleVertical
              : kTextProfileSubTitle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      ),
    );
  }
}
