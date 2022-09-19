import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '/constants.dart';
import '/view/worldStates_view.dart';

class SplashView extends StatefulWidget {
  static const id = '/';

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
          ..repeat();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, WorldStatesView.id, (route) => false);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            child: SizedBox(
              height: 200.0,
              width: 200.0,
              child: Center(
                child: Image.asset(
                  'assets/virus.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _animationController.value * 2.0 * math.pi,
                child: child,
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Covid-19\n Tracker App',
              textAlign: TextAlign.center,
              style: kAllOverTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
