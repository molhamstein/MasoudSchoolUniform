//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(home: Container());
//  }
//}

import 'package:almasaood_app/ui/Cart.dart';
import 'package:almasaood_app/ui/CheckNumber.dart';
import 'package:almasaood_app/ui/Home.dart';
import 'package:almasaood_app/ui/PickUpLocation.dart';
import 'package:almasaood_app/ui/ProductDetails.dart';
import 'package:almasaood_app/ui/SplashScreen.dart';
import 'package:almasaood_app/ui/VerificationCode.dart';
import 'package:almasaood_app/ui/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'local/AppLocal.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData(fontFamily: 'Proxima Nova'),
      supportedLocales: [const Locale('ar'), const Locale('en', 'US')],
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },
      home:  PickUpLocation(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(AppLocalizations.of(context).trans('hello_world')),
      ),
    );
  }
}

void main() {
  runApp(new MyApp());
}
