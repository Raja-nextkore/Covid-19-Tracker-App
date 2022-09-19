import 'package:flutter/material.dart';

import '/constants.dart';

class TrackCountries extends StatelessWidget {
  final VoidCallback onTap;

  const TrackCountries({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: const Color(0Xff1aa260),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: Text(
            'Track Countries',
            style: kAllOverTextStyle,
          ),
        ),
      ),
    );
  }
}
