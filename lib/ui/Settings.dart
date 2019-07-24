import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/VerifyModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../AlmasaoodColors.dart';
import '../DataStore.dart';
import 'CheckNumber.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AlmasaoodColors.primaryColor,
        iconTheme: IconThemeData(color: AlmasaoodColors.textDark),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AlmasaoodColors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: AlmasaoodColors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 150,
                      width: 150,
                    ),
                  )),
              Container(
                color: AlmasaoodColors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, bottom: 64, left: 32, right: 32),
                      child: Text(
                        "Some Slogan about the service",
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _launchEmail();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).trans('contact_us'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _lunchPrivacy();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text( AppLocalizations.of(context).trans('terms_of_service'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64.0, bottom: 32),
                      child: InkWell(
                        onTap: () {
                          dataStore.setUser(VerifyModel());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CheckNumber()));
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => CheckNumber()),
                              ModalRoute.withName('/sign'));
//                        Navigator.of(context)
//                            .pushNamedAndRemoveUntil('/SplashScreen', (Route<dynamic> route) => false);
                        },
                        child: Text(
                          AppLocalizations.of(context).trans('log_out'),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchEmail() async {
    const url =
        "mailto:noreplay@almasaood.com?subject=From Almasaood tailoring app&body=Hi there";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _lunchPrivacy() async {
    const url = "https://jawlatcom.com/privacy/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
