import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/StatesModel.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'PickUpLocation.dart';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AlmasaoodColors.pink,
          elevation: 0,
        ),
        body: Container(
          color: AlmasaoodColors.pink,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 64.0, right: 64),
                    child: Text(
                      "Choose Where do you want to pickup your items",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AlmasaoodColors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 20,
                              offset: Offset(0, 11),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32.0, bottom: 32, left: 16, right: 16),
                          child: StreamBuilder<List<StatesModel>>(
                              stream: bloc.statesStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PickUpLocation()));

//                                                f_getMarkers(){}

                                              },
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    snapshot.data[index].nameEn,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 8),
                                              child: Divider(
                                                color: AlmasaoodColors.textDark,
                                                height: 20,
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                AlmasaoodColors.primaryColor)),
                                  );
                                }
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void initState() {
    bloc.f_getStates();
  }
}
