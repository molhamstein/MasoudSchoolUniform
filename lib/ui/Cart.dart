import 'package:almasaood_app/Widgets/MainButton.dart';
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
            const EdgeInsets.only(top: 80.0, left: 24, right: 24, bottom: 32),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(color: AlmasaoodColors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/child.png",
                                        height: 120,
                                        width: 80,
                                      ),
                                      Expanded(
                                        child: Container(
//                                        color: AlmasaoodColors.darkBlue,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text("Formal"),
                                                      Text("TROUSER/SHORT")
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text("AED"),
                                                      Text("450"),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          child: Container(
                                                            color: AlmasaoodColors
                                                                .darkBlue,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right: 8),
                                                              child: Text(
                                                                "KG-1",
                                                                style: TextStyle(
                                                                    color:
                                                                        AlmasaoodColors
                                                                            .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10.0),
                                                          child: Row(
                                                            children: <Widget>[
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25),
                                                                child: Container(
                                                                  color: AlmasaoodColors
                                                                      .lightBlue,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8.0,
                                                                        right: 8),
                                                                    child: Text(
                                                                      "Male",
                                                                      style: TextStyle(
                                                                          color: AlmasaoodColors
                                                                              .black),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25),
                                                                child: Container(
                                                                  color:
                                                                      AlmasaoodColors
                                                                          .darkBlue,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            12.0,
                                                                        right: 12,
                                                                        top: 2,
                                                                        bottom:
                                                                            2),
                                                                    child: Text(
                                                                      "s",
                                                                      style: TextStyle(
                                                                          color: AlmasaoodColors
                                                                              .white),
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
                                                      child: Container(
                                                        color: AlmasaoodColors
                                                            .darkBlue,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            4.0),
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  size: 35,
                                                                  color:
                                                                      AlmasaoodColors
                                                                          .white,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            16.0,
                                                                        right:
                                                                            16),
                                                                child: Text(
                                                                  "3",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: AlmasaoodColors
                                                                          .white,
                                                                      fontSize:
                                                                          32),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            4.0),
                                                                child: Icon(
                                                                  Icons.add,
                                                                  size: 35,
                                                                  color:
                                                                      AlmasaoodColors
                                                                          .white,
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 2,
                                      color: AlmasaoodColors.textDark,
                                    ),
                                  )
//                                Divider(color: AlmasaoodColors.black,)
                                ],
                              ),
                            ),
                          ),
                        );
                      }, childCount: 5))
                    ],
                  ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Delivery"),
                            CupertinoSwitch(
                              onChanged: null,
                              value: true,
                              activeColor: AlmasaoodColors.darkGreen,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Total"),
                              Row(
                                children: <Widget>[Text("AED"), Text("33000")],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                  child: MainButton(
                    text: "Submit",
                    color: AlmasaoodColors.darkBlue,
                    textColor: AlmasaoodColors.white,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
