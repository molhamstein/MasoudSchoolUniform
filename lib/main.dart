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

import 'package:almasaood_app/ui/CheckNumber.dart';
import 'package:almasaood_app/ui/Settings.dart';
import 'package:almasaood_app/ui/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'DataStore.dart';
import 'local/AppLocal.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(initialRoute: '/',routes: {'/': (context) => SplashScreen(),
    '/sign':(context)=>CheckNumber()},
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ProximaNova'),
      supportedLocales: [const Locale('en'), const Locale('en', 'US')],
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
//      home: SplashScreen(),
    );
  }

  @override
  void initState() {
    dataStore.user;
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
