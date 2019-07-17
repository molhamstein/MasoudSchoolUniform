import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/ProductModel.dart';
import 'package:almasaood_app/models/gradesModel.dart';
import 'package:almasaood_app/models/productDetailsModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'Cart.dart';
import 'ProductDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  List<String> s = ["All", "First Grade", "Secondary", "KG"];
  List<bool> checkedList = new List();

  @override
  void initState() {

//    bloc.createOrder();
    bloc.f_grades();
    bloc.f_getProducts(-1);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight) / 1.1;
    final double itemWidth = size.width;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: AlmasaoodColors.pink,
              image: DecorationImage(
                  image: ExactAssetImage(
                    "assets/images/bg_MeasureTape.png",
                  ),
                  alignment: FractionalOffset.topRight),
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cart()),
                                );
                              },
                              child: Image.asset(
                                "assets/images/ic_cart.png",
                                scale: 1.5,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
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
                                    "Abdulrahman",
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
                                width: 180,
                                height: 180,
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: StreamBuilder<List<GradesModel>>(
                            stream: bloc.gradesStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {

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
                                                  BorderRadius.circular(5),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    for (int i = 0;
                                                        i <
                                                            snapshot
                                                                .data.length;
                                                        i++) {
                                                      checkedList[i] = (false);
                                                      checkedList[index] = true;
                                                    }
                                                    bloc.f_getProducts(snapshot
                                                        .data[index].id);
                                                  });
                                                },
                                                child: Container(
                                                  color: checkedList[index] ==
                                                          false
                                                      ? AlmasaoodColors.darkBlue
                                                      : AlmasaoodColors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 24.0,
                                                            right: 24,
                                                            top: 8,
                                                            bottom: 8),
                                                    child: Text(
                                                      snapshot
                                                          .data[index].nameEn,
                                                      style: TextStyle(
                                                          color: checkedList[
                                                                      index] ==
                                                                  false
                                                              ? AlmasaoodColors
                                                                  .white
                                                              : AlmasaoodColors
                                                                  .lightBlue),
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
                      )
                    ]);
                  }, childCount: 1),
                ),
                StreamBuilder<List<ProductsModel>>(
                    stream: bloc.productsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {

                        return SliverGrid(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      bloc.f_productDetails(
                                          snapshot.data[index]);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails()),
                                      );
                                    },
                                    child: ProductCard(snapshot.data[index])),
                              );
                            }, childCount: snapshot.data.length),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (itemWidth / itemHeight),
                                    crossAxisCount: 2));
                      } else {
                        return SliverGrid(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(),
                              );
                            }, childCount: 0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (itemWidth / itemHeight),
                                    crossAxisCount: 2));
                      }
                    })
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
            ));
  }

  Widget ProductCard(ProductsModel data) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 220,
            margin: EdgeInsets.only(left: 8, right: 8),
            color: AlmasaoodColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          color: AlmasaoodColors.darkBlue,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Text(
                              data.grade.nameEn,
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
                      color: AlmasaoodColors.lightBlue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "AED",
                              style: TextStyle(
                                  color: AlmasaoodColors.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            SizedBox(
                                width: 30,
                                child: AutoSizeText(
                                  data.price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AlmasaoodColors.white,
                                      fontSize: 32),
                                  maxLines: 1,
                                )),
                          ],
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
    );
  }
}
