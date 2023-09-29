import 'package:flutter/material.dart';
import 'package:sdgp/constants.dart';
import 'package:sdgp/screens/onboarding/get_started.dart';

import 'Consent_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iDerm24',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: someThemeSwatch(Color(0xFF5F6E54)),
        primaryColor: Color(0xFF5F6E54),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kParagraphColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: GetStartedPage(),
    );
  }
}

MaterialColor someThemeSwatch(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });

  return MaterialColor(color.value, swatch);
}