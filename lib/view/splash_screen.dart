import 'dart:async';

import 'package:flutter/material.dart';

import '../../view-model/routes/named_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashScreen();
}

class _SplashScreen extends State<Splash> {
  double opacity = 1;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        opacity = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: AnimatedOpacity(
        opacity: opacity,
        duration: kThemeAnimationDuration,
        onEnd: () {
          if (opacity == 0) {
            Navigator.pushReplacementNamed(context, NamedRoutes.grill);
          }
        },
        child: Center(
          child: Text(
            'SWC Challenge',
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
