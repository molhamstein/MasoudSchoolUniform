import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/ProductModel.dart';
import 'package:almasaood_app/models/gradesModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AlmasaoodColors.dart';
import '../ApiProvider.dart';
import '../DataStore.dart';
import 'Cart.dart';
import 'ProductDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> checkedList = [true];

  @override
  void initState() {
    bloc.f_grades();
    bloc.f_getProducts();
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/

    double itemHeight;

    if (size.height > 540) {
      itemHeight = (size.height - kToolbarHeight) / 1.3;
    } else {
      itemHeight = (size.height - kToolbarHeight) / 1.1;
    }
    final double itemWidth = size.width;
    return WillPopScope(onWillPop: onWillPop,
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                color: AlmasaoodColors.pink,
              ),
              child: Stack(
                children: <Widget>[
                  AppBar(
                    backgroundColor: AlmasaoodColors.pink,
                    toolbarOpacity: 1,
                    elevation: 0,
                    leading: Container(),
                    actions: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cart()),
                          );
                        },
                        child: Image.asset(
                          "assets/images/ic_cart.png",
                          scale: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/ic_needleGray.png",
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 1.2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 72.0),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            return Column(children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Welcome",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: AlmasaoodColors.text),
                                      ),
//                              Text(
//                                "Abdulrahman",
//                                style: TextStyle(
//                                    fontSize: 36, fontWeight: FontWeight.w700),
//                              )
                                      SizedBox(
                                          width: 100,
                                          child: AutoSizeText(
                                            dataStore.user.user.firstName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 32),
                                            maxLines: 1,
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/logo.png",
                                        width: 130,
                                        height: 130,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 50,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: StreamBuilder<List<GradesModel>>(
                                      stream: bloc.gradesStream,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData &&
                                            snapshot.data != null) {
                                          return ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: snapshot.data.length,
                                              itemBuilder: (context, index) {
                                                for (int i = 0;
                                                    i < snapshot.data.length;
                                                    i++) checkedList.add(false);
                                                return Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0, right: 8),
                                                  child: Row(
                                                    children: <Widget>[
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <
                                                                      snapshot
                                                                          .data
                                                                          .length;
                                                                  i++) {
                                                                checkedList[i] =
                                                                    (false);
                                                                checkedList[
                                                                    index] = true;
                                                              }
                                                              bloc.f_sortProduct(
                                                                  snapshot
                                                                      .data[index]
                                                                      .id);
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 35,
                                                            color: checkedList[
                                                                        index] ==
                                                                    false
                                                                ? AlmasaoodColors
                                                                    .primaryColor
                                                                : AlmasaoodColors
                                                                    .secondary,
                                                            child: Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 4.0,
                                                                        right: 4),
                                                                child:
                                                                    DashedContainer(
                                                                  blankLength: 10,
                                                                  dashColor:
                                                                      AlmasaoodColors
                                                                          .white,
                                                                  borderRadius: 2,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8.0,
                                                                        right: 8,
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                    child: Text(
                                                                      snapshot
                                                                          .data[
                                                                              index]
                                                                          .nameEn,
                                                                      style: TextStyle(
                                                                          color: AlmasaoodColors
                                                                              .white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ),
                              )
                            ]);
                          }, childCount: 1),
                        ),
                        StreamBuilder<List<ProductsModel>>(
                            stream: bloc.productsStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                return SliverGrid(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {
                                              bloc.f_productDetails(
                                                  snapshot.data[index]);
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                      transitionDuration: Duration(seconds: 1),
                                                      pageBuilder: (_, __, ___) => ProductDetails()));
//                                              Navigator.push(
//                                                context,
//                                                MaterialPageRoute(
//                                                    builder: (context) =>
//                                                        ProductDetails()),
//                                              );
                                            },
                                            child: ProductCard(
                                                snapshot.data[index])),
                                      );
                                    }, childCount: snapshot.data.length),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio:
                                                (itemWidth / itemHeight),
                                            crossAxisCount: 2));
                              } else {
                                return SliverGrid(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(),
                                      );
                                    }, childCount: 0),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio:
                                                (itemWidth / itemHeight),
                                            crossAxisCount: 2));
                              }
                            })
                      ],
                    ),
                  ),
                ],
              )

//          Column(
//        children: <Widget>[
//          Expanded(
//              child: StaggeredGridView.countBuilder(
//            crossAxisCount: 2,
//            itemCount: 8,
//            itemBuilder: (BuildContext context, int index) {
//              return Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: ProductCard(),
//              );
//            },
//            staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
//            mainAxisSpacing: 4.0,
//            crossAxisSpacing: 4.0,
//          )),
//        ],
//      ),
              )),
    );
  }

  Widget ProductCard(ProductsModel data) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: 220,
              margin: EdgeInsets.only(left: 8, right: 8),
              color: AlmasaoodColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Hero(
                      tag:"id"+data.id.toString(),
                      child: Container(
                        child: data.image != null
                            ? Image.network(
                                data.image.file,
                                height: 100,
                                width: 100,
                              )
                            : Image.asset(
                                "assets/images/child.png",
                                height: 100,
                                width: 100,
                              ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                      child: Text(data.nameEn,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AlmasaoodColors.text))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        MediaQuery.of(context).size.width > 330
                            ? SizedBox(
                                width: 10,
                              )
                            : Container(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Container(
                            color: AlmasaoodColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, top: 2, bottom: 2),
                              child: Text(
                                "KG-1",
                                style: TextStyle(color: AlmasaoodColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 225,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 40,
                        color: data.gender == "male"
                            ? AlmasaoodColors.lightBlue
                            : AlmasaoodColors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 5, left: 5, right: 5),
                          child: DashedContainer(
                            blankLength: 10,
                            dashColor: AlmasaoodColors.white,
                            borderRadius: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "AED",
                                    style: TextStyle(
                                        color: AlmasaoodColors.white,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width <
                                              330
                                          ? 30
                                          : 30,
                                      child: Center(
                                        child: AutoSizeText(
                                          data.getPrice(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AlmasaoodColors.white,
                                              fontSize: 32),
                                          maxLines: 1,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> onWillPop() {

    SystemChannels.platform.invokeMethod('SystemNavigator.pop');

  }
}
