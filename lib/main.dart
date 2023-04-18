import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swc_challenge/view/shared/theme.dart';

import 'view-model/routes/named_routes.dart';
import 'view-model/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SwcChallenge());
}

class SwcChallenge extends StatelessWidget {
  const SwcChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: NamedRoutes.splash,
        routes: Routes.all(context),
        theme: AppTheme.defaultTheme);
  }
}
