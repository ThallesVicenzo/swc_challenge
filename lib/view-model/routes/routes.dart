import 'package:flutter/material.dart';
import 'package:swc_challenge/view/calendar.dart';
import 'package:swc_challenge/view/grill_rent/grill_rent_screen.dart';

import '../../view/splash_screen.dart';
import 'named_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> all(BuildContext context) {
    return {
      NamedRoutes.splash: (context) => const Splash(),
      NamedRoutes.grill: (context) => const GrillRent(),
      NamedRoutes.calendar: (context) => const Calendar(),
    };
  }
}
