import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/productDetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'States.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AlmasaoodColors.textDark),
          elevation: 0,
          backgroundColor: AlmasaoodColors.pink,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              "assets/images/close.png",
              scale: 6,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: AlmasaoodColors.pink,
          ),
          child: StreamBuilder<List<ProductDetailsModel>>(
              stream: bloc.cartStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 8, right: 8, bottom: 32),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                color: AlmasaoodColors.white,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child:
                                          StreamBuilder<
                                                  List<ProductDetailsModel>>(
                                              stream: bloc.cartStream,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData &&
                                                    snapshot.data != null) {
                                                  return CustomScrollView(
                                                    slivers: <Widget>[
                                                      SliverList(
                                                          delegate:
                                                              SliverChildBuilderDelegate(
                                                                  (context,
                                                                      index) {
                                                        return Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Row(
                                                                    children: <
                                                                        Widget>[
                                                                      snapshot.data[index].image.file !=
                                                                              ""
                                                                          ? Image
                                                                              .network(
                                                                              snapshot.data[index].image.file,
                                                                              height: 90,
                                                                              width: 80,
                                                                            )
                                                                          : Image
                                                                              .asset(
                                                                              "assets/images/child.png",
                                                                              height: 90,
                                                                              width: 80,
                                                                            ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
//
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        snapshot.data[index].name(AppLocalizations.of(context).locale),
                                                                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AlmasaoodColors.textDark),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        AppLocalizations.of(context).trans('AED'),
                                                                                        style: TextStyle(fontWeight: FontWeight.w700, color: AlmasaoodColors.text),
                                                                                      ),
                                                                                      Text(
                                                                                        snapshot.data[index].price,
                                                                                        style: TextStyle(fontWeight: FontWeight.w700, color: AlmasaoodColors.textDark, fontSize: 26),
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(top: 8.0),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: <Widget>[
                                                                                    Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: <Widget>[
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(25),
                                                                                          child: Container(
                                                                                            color: AlmasaoodColors.primaryColor,
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 2, bottom: 2),
                                                                                              child: Text(
                                                                                                snapshot.data[index].grade.name(AppLocalizations.of(context).locale),
                                                                                                style: TextStyle(color: AlmasaoodColors.white),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(top: 8.0),
                                                                                          child: Row(
                                                                                            children: <Widget>[
                                                                                              ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(25),
                                                                                                child: Container(
                                                                                                  color: snapshot.data[index].gender == "male" ? AlmasaoodColors.lightBlue : AlmasaoodColors.red,
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 2, bottom: 2),
                                                                                                    child: Text(
                                                                                                      snapshot.data[index].genderT(AppLocalizations.of(context).locale),
                                                                                                      style: TextStyle(color: AlmasaoodColors.black, fontWeight: FontWeight.w700),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 8,
                                                                                              ),
                                                                                              ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(25),
                                                                                                child: Container(
                                                                                                  color: AlmasaoodColors.primaryColor,
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.only(left: 12.0, right: 12, top: 2, bottom: 2),
                                                                                                    child: Text(
                                                                                                      snapshot.data[index].size.code,
                                                                                                      style: TextStyle(color: AlmasaoodColors.white, fontWeight: FontWeight.w700),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                      child: Container(
                                                                                        color: AlmasaoodColors.primaryColor,
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.only(left: 4.0, right: 4, top: 2, bottom: 2),
                                                                                          child: Row(
                                                                                            children: <Widget>[
                                                                                              InkWell(
                                                                                                onTap: () {
                                                                                                  setState(() {
                                                                                                    bloc.f_removeItemFromCart(snapshot.data[index].count, index);
                                                                                                  });
                                                                                                },
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.only(left: 4.0),
                                                                                                  child: Icon(
                                                                                                    Icons.remove,
                                                                                                    size: 27,
                                                                                                    color: AlmasaoodColors.white,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.only(left: 12.0, right: 12),
                                                                                                child: Text(
                                                                                                  snapshot.data[index].count.toString(),
                                                                                                  style: TextStyle(fontWeight: FontWeight.bold, color: AlmasaoodColors.white, fontSize: 28),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () {
                                                                                                  bloc.f_IncreaseOrderCount(index);
                                                                                                },
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.only(right: 4.0),
                                                                                                  child: Icon(
                                                                                                    Icons.add,
                                                                                                    size: 27,
                                                                                                    color: AlmasaoodColors.white,
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  index !=
                                                                          snapshot.data.length -
                                                                              1
                                                                      ? Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 16.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            height:
                                                                                2,
                                                                            color:
                                                                                AlmasaoodColors.text,
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                                  childCount:
                                                                      snapshot
                                                                          .data
                                                                          .length))
                                                    ],
                                                  );
                                                } else {
                                                  return Container();
                                                }
                                              }),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 16.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 2,
                                                  color: AlmasaoodColors.text,
                                                )),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  AppLocalizations.of(context)
                                                      .trans('delivery'),
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AlmasaoodColors
                                                          .textDark),
                                                ),
                                                CupertinoSwitch(
                                                  onChanged: (_val) {
                                                    onChange();
                                                  },
                                                  value: bloc.withDelivery,
                                                  activeColor: AlmasaoodColors
                                                      .primaryColor,
                                                ),
                                              ],
                                            ),
                                            Visibility(
                                              visible: bloc.withDelivery,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .trans(
                                                              'delivery_coast'),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AlmasaoodColors
                                                              .text),
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text(
                                                          "AED",
                                                          style: TextStyle(
                                                              color:
                                                                  AlmasaoodColors
                                                                      .text,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 18),
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          "10",
                                                          style: TextStyle(
                                                              color:
                                                                  AlmasaoodColors
                                                                      .textDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 26),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14.0, bottom: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    AppLocalizations.of(context)
                                                        .trans('total'),
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AlmasaoodColors
                                                            .textDark),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .trans('AED'),
                                                        style: TextStyle(
                                                            color:
                                                                AlmasaoodColors
                                                                    .text,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 18),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      StreamBuilder<double>(
                                                          stream: bloc
                                                              .productPriceStream,
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return Text(
                                                                snapshot.data
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: AlmasaoodColors
                                                                        .textDark,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        26),
                                                              );
                                                            } else {
                                                              return Container();
                                                            }
                                                          })
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        StreamBuilder<List<ProductDetailsModel>>(
                            stream: bloc.cartStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 32),
                                  child: MainButton(
                                    text: AppLocalizations.of(context)
                                        .trans('Submit'),
                                    color: AlmasaoodColors.primaryColor,
                                    textColor: AlmasaoodColors.white,
                                    onPressed: () {
//                            bloc.createOrder(snapshot.data);

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => States()));
                                    },
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            })
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 11),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AlmasaoodColors.white,
                        ),
                        width: MediaQuery.of(context).size.width - 64,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.shopping_cart,
                                  size: 100,
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  "You haven't select items yet",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
              }),
        ));
  }

  void onChange() {
    setState(() {
      if (bloc.withDelivery == true) {
        bloc.withDelivery = false;
        bloc.f_estimatedPrice(bloc.withDelivery);
        print(bloc.withDelivery);
      } else {
        bloc.withDelivery = true;
        bloc.f_estimatedPrice(bloc.withDelivery);
        print(bloc.withDelivery);
      }
    });
  }

  @override
  void initState() {
    bloc.withDelivery = false;
    bloc.f_estimatedPrice(bloc.withDelivery);
  }
}
