import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/productDetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: AlmasaoodColors.pink,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 80.0, left: 8, right: 8, bottom: 32),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: AlmasaoodColors.white,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: StreamBuilder<List<ProductDetailsModel>>(
                            stream: bloc.cartStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                return CustomScrollView(
                                  slivers: <Widget>[
                                    SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                            (context, index) {
                                      return Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    snapshot.data[index].image
                                                                .file !=
                                                            ""
                                                        ? Image.network(
                                                            snapshot.data[index]
                                                                .image.file,
                                                            height: 90,
                                                            width: 80,
                                                          )
                                                        : Image.asset(
                                                            "assets/images/child.png",
                                                            height: 90,
                                                            width: 80,
                                                          ),
                                                    Expanded(
                                                      child: Container(
//                                        color: AlmasaoodColors.primaryColor,
                                                        child: Column(
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      snapshot
                                                                          .data[
                                                                              index]
                                                                          .nameEn,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Text("AED"),
                                                                    Text(snapshot
                                                                        .data[
                                                                            index]
                                                                        .price),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(25),
                                                                        child:
                                                                            Container(
                                                                          color:
                                                                              AlmasaoodColors.primaryColor,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 6.0, right: 6),
                                                                            child:
                                                                                Text(
                                                                              snapshot.data[index].grade.nameEn,
                                                                              style: TextStyle(color: AlmasaoodColors.white),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 8.0),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(25),
                                                                              child: Container(
                                                                                color: AlmasaoodColors.lightBlue,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                                                  child: Text(
                                                                                    snapshot.data[index].gender,
                                                                                    style: TextStyle(color: AlmasaoodColors.black),
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
                                                                                    style: TextStyle(color: AlmasaoodColors.white, fontSize: 10),
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
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                    child:
                                                                        Container(
                                                                      color: AlmasaoodColors
                                                                          .primaryColor,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                4.0,
                                                                            right:
                                                                                4,
                                                                            top:
                                                                                2,
                                                                            bottom:
                                                                                2),
                                                                        child:
                                                                            Row(
                                                                          children: <
                                                                              Widget>[
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
                                                                                  size: 30,
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
                                                                                  size: 30,
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
                                                index != 4
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 16.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 2,
                                                          color: AlmasaoodColors
                                                              .textDark,
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }, childCount: snapshot.data.length))
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
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 2,
                                    color: AlmasaoodColors.textDark,
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Delivery"),
                                  CupertinoSwitch(
                                    onChanged: null,
                                    value: true,
                                    activeColor: AlmasaoodColors.primaryColor,
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 24.0, bottom: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Total"),
                                    Row(
                                      children: <Widget>[
                                        Text("AED"),
                                        StreamBuilder<double>(
                                          stream: bloc.productPriceStream,
                                          builder: (context, snapshot) {
                                            if(snapshot.hasData){
                                              return  Text(snapshot.data.toString());

                                            }else {return Container();}

                                          }
                                        )
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
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32),
              child: MainButton(
                text: "Submit",
                color: AlmasaoodColors.primaryColor,
                textColor: AlmasaoodColors.white,
                onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => ProductDetails()),
//                      );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
