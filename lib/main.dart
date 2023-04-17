import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view-model/providers/grills_info.dart';
import 'view-model/routes/named_routes.dart';
import 'view-model/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GrillsInfo()),
      ],
      child: const SwcChallenge(),
    ),
  );
}

class SwcChallenge extends StatelessWidget {
  const SwcChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoutes.splash,
      routes: Routes.all(context),
      theme: ThemeData(
        splashColor: const Color(0xFFFFFFFF),
        primaryColor: const Color(0xFF11159A),
        highlightColor: const Color(0xFFFFBE00),
        primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xFF11159A),
            fontSize: 40,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 25,
          ),
          bodySmall: TextStyle(
            color: Color(0xFF11159A),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
