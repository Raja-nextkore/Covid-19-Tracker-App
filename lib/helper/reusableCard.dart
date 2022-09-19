import 'package:flutter/material.dart';

import '/constants.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final String value;

  const ReusableCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kAllOverTextStyle,
              ),
              Text(
                value,
                style: kAllOverTextStyle,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
