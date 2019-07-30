import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/StatesModel.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'PickUpLocation.dart';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation titleAnimation;
  Animation statesAnimation;

  @override
  void initState() {
    bloc.f_getStates();
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));

    titleAnimation = Tween(begin: -1.30, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.30, 1.0, curve: ElasticOutCurve(0.8))));

    statesAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.45, 1.0, curve: ElasticOutCurve(0.8))));

    animationController.forward();
  }

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
                    child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.translationValues(
                              0.0,
                              titleAnimation.value *
                                  MediaQuery.of(context).size.height,
                              0.0),
                          child: child,
                        );
                      },
                      child: Text(
                        bloc.withDelivery
                            ? AppLocalizations.of(context)
                                .trans('states_please_choose')
                            : AppLocalizations.of(context).trans(
                                'choose_where_do_you_want_to_pick_items_from'),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.translationValues(
                              0.0,
                              statesAnimation.value *
                                  MediaQuery.of(context).size.height,
                              0.0),
                          child: child,
                        );
                      },
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
                                                  bloc.f_getMarkers(
                                                      snapshot.data[index].id);
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PickUpLocation()));
                                                },
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      snapshot.data[index].name(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .locale),
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
                                                  color:
                                                      AlmasaoodColors.textDark,
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
                                                  AlmasaoodColors
                                                      .primaryColor)),
                                    );
                                  }
                                }),
                          ),
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
}
