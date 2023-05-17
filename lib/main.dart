import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:swayambhu_wellness/home_view.dart';

void main() {
  runApp(Localizations(
    delegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate, // add this line
    ],
    locale: const Locale("en"),
    child: Dashboard(),
  ));
}


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
      home: MyHomeView(),
    );
  }
}