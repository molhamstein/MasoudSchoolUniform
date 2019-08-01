import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/ProductModel.dart';
import 'package:almasaood_app/models/gradesModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import '../AlmasaoodColors.dart';
import '../DataStore.dart';
import 'Cart.dart';
import 'ProductDetails.dart';
import 'Settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<bool> checkedList = [true];

  AnimationController animationController;
  AnimationController activeAnimationController;
  AnimationController productsAnimationController;
  AnimationController activeProductsAnimationController;

  Animation logoAnimation;
  Animation logoAnimationFade;

  Animation nameAnimation;
  Animation gradeAnimation;
  Animation activeGradeAnimation;

  Animation productsAnimation;
  Animation activeProductsAnimation;

  @override
  void initState() {

    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    activeAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    productsAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));
    activeProductsAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));
    logoAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: ElasticInOutCurve(2)));
    logoAnimationFade = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.5, 1.0)));
    nameAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: ElasticInOutCurve(2)));
    gradeAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: ElasticInOutCurve(2)));
    activeGradeAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: ElasticInOutCurve(2)));
    productsAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 1.0, curve: ElasticOutCurve(0.8))));
    activeProductsAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.1, 1.0, curve: ElasticOutCurve(0.8))));
    activeAnimationController.forward();
    activeProductsAnimationController.forward();
    productsAnimationController.forward();
    animationController.forward().then((_) {
      bloc.f_grades();
      bloc.f_getProducts();
    });
    bloc.f_getCartCount();
  }

  @override
  void didChangeDependencies() {
    bloc.f_getCartCount();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight;

    if (size.height > 540) {
      itemHeight = (size.height - kToolbarHeight) / 1.3;
    } else {
      itemHeight = (size.height - kToolbarHeight) / 1.1;
    }
    final double itemWidth = size.width;
    return RefreshIndicator(onRefresh: onRefersh,
      child: WillPopScope(
        onWillPop: onWillPop,
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
                            activeAnimationController.reverse();
                            productsAnimationController.reverse();
                            activeProductsAnimationController.reverse();
                            animationController.reverse().then((_) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => Cart()))
                                  .then((val) {
                                activeAnimationController.forward();
                                animationController.forward();
                                productsAnimationController.forward();
                                activeProductsAnimationController.forward();
                              });
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 28,
                                height: 28,
                                child: Stack(
                                  children: <Widget>[
                                    Icon(
                                      Icons.shopping_cart,
                                      color: AlmasaoodColors.textDark,
                                      size: 25,
                                    ),
                                    StreamBuilder<int>(
                                        stream: bloc.cartCountStream,
                                        builder: (context, snapshot) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 17,
                                                    height: 17,
                                                    child: Center(
                                                      child: Text(
                                                        snapshot.data != null
                                                            ? snapshot.data
                                                                .toString()
                                                            : "0",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: AlmasaoodColors
                                                            .darkRed,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                100),
                                                        border: Border.all(
                                                            color: AlmasaoodColors
                                                                .white)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            activeAnimationController.reverse();
                            productsAnimationController.reverse();
                            activeProductsAnimationController.reverse();
                            animationController.reverse().then((_) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => Settings()))
                                  .then((val) {
                                activeAnimationController.forward();
                                animationController.forward();
                                productsAnimationController.forward();
                                activeProductsAnimationController.forward();
                              });
                            });
                          },
                          child: Icon(
                            Icons.settings,
                            color: AlmasaoodColors.textDark,
                          ),
                        ),
                        SizedBox(
                          width: 8,
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
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              return Column(children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    AnimatedBuilder(
                                      animation: animationController,
                                      builder: (context, child) {
                                        return Transform(
                                          child: child,
                                          transform: Matrix4.translationValues(
                                              nameAnimation.value *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              0.0,
                                              0.0),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)
                                                .trans('welcome'),
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
                                    ),
                                    Column(
                                      children: <Widget>[
                                        AnimatedBuilder(
                                          animation: animationController,
                                          builder: (context, child) {
                                            return Transform(
                                              child: child,
                                              transform:
                                                  Matrix4.translationValues(
                                                      0.0,
                                                      logoAnimation.value *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      0.0),
                                            );
                                          },
                                          child: Image.asset(
                                            "assets/images/logo.png",
                                            width: 130,
                                            height: 130,
                                          ),
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
                                              snapshot.data != null && snapshot.data.isNotEmpty) {
                                            return AnimatedBuilder(
                                              animation:
                                                  activeAnimationController,
                                              builder: (context, child) {
                                                return Transform(
                                                  transform:
                                                      Matrix4.translationValues(
                                                          activeGradeAnimation
                                                                  .value *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                          0.0,
                                                          0.0),
                                                  child: child,
                                                );
                                              },
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: snapshot.data.length,
                                                  itemBuilder: (context, index) {
                                                    for (int i = 0;
                                                        i < snapshot.data.length;
                                                        i++)
                                                      checkedList.add(false);
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8),
                                                      child: Row(
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  for (int i = 0;
                                                                      i <
                                                                          snapshot
                                                                              .data
                                                                              .length;
                                                                      i++) {
                                                                    checkedList[
                                                                            i] =
                                                                        (false);
                                                                    checkedList[
                                                                            index] =
                                                                        true;
                                                                  }
                                                                  bloc.f_sortProduct(
                                                                      snapshot
                                                                          .data[
                                                                              index]
                                                                          .id);
                                                                });
                                                              },
                                                              child: Container(
                                                                height: 37,
                                                                color: checkedList[
                                                                            index] ==
                                                                        false
                                                                    ? AlmasaoodColors
                                                                        .primaryColor
                                                                    : AlmasaoodColors
                                                                        .secondary,
                                                                child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 4.0,
                                                                        right: 4,
                                                                        bottom: 2,
                                                                        top: 2),
                                                                    child:
                                                                        DashedContainer(
                                                                      blankLength:
                                                                          10,
                                                                      dashColor:
                                                                          AlmasaoodColors
                                                                              .white,
                                                                      borderRadius:
                                                                          2,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                                .only(
                                                                            left:
                                                                                8.0,
                                                                            right:
                                                                                8,
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          snapshot
                                                                              .data[index]
                                                                              .name(AppLocalizations.of(context).locale),
                                                                          style: TextStyle(
                                                                              color:
                                                                                  AlmasaoodColors.white,
                                                                              fontSize: 12),
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
                                                  }),
                                            );
                                          } else {
                                            return AnimatedBuilder(
                                              builder: (context, child) {
                                                return Transform(
                                                  transform:
                                                      Matrix4.translationValues(
                                                          gradeAnimation.value *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                          0.0,
                                                          0.0),
                                                  child: child,
                                                );
                                              },
                                              animation: animationController,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 3,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8),
                                                      child: Shimmer.fromColors(
                                                        direction:
                                                            ShimmerDirection.ttb,
                                                        period:
                                                            Duration(seconds: 4),
                                                        baseColor: AlmasaoodColors
                                                            .shimmerColor,
                                                        highlightColor:
                                                            AlmasaoodColors
                                                                .shimmerColorLight,
                                                        child: Row(
                                                          children: <Widget>[
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Container(
                                                                color: AlmasaoodColors
                                                                    .primaryColor,
                                                                width: 70,
                                                                height: 35,
                                                                child: Center(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 4.0,
                                                                        right: 4),
                                                                    child:
                                                                        DashedContainer(
                                                                      blankLength:
                                                                          10,
                                                                      dashColor:
                                                                          AlmasaoodColors
                                                                              .white,
                                                                      borderRadius:
                                                                          2,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                                .only(
                                                                            left:
                                                                                8.0,
                                                                            right:
                                                                                8,
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          "",
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            );
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
//                              print("length is "+dataStore.products.length.toString());

                                if (snapshot.hasData &&
                                    snapshot.data != null &&
                                    snapshot.data.isNotEmpty) {
                                  return SliverGrid(
                                      delegate: SliverChildBuilderDelegate(
                                          (context, index) {
                                        return AnimatedBuilder(
                                          animation:
                                              activeProductsAnimationController,
                                          builder: (context, child) {
                                            return Transform(
                                              transform:
                                                  Matrix4.translationValues(
                                                      0.0,
                                                      activeProductsAnimation
                                                              .value *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      0.0),
                                              child: child,
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                onTap: () {
                                                  bloc.f_productDetails(
                                                      snapshot.data[index]);
                                                  Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                          transitionDuration:
                                                              Duration(
                                                                  seconds: 1),
                                                          pageBuilder: (_, __,
                                                                  ___) =>
                                                              ProductDetails()));
//                                              Navigator.push(
//                                                context,
//                                                MaterialPageRoute(
//                                                    builder: (context) =>
//                                                        ProductDetails()),
//                                              );
                                                },
                                                child: ProductCard(
                                                    snapshot.data[index])),
                                          ),
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
                                        return AnimatedBuilder(
                                          animation: productsAnimationController,
                                          builder: (context, child) {
                                            return Transform(
                                              transform:
                                                  Matrix4.translationValues(
                                                      0.0,
                                                      productsAnimation.value *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      0.0),
                                              child: child,
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                direction: ShimmerDirection.ttb,
                                                period: Duration(seconds: 4),
                                                baseColor:
                                                    AlmasaoodColors.shimmerColor,
                                                highlightColor: AlmasaoodColors
                                                    .shimmerColorLight,
                                                child: Container(
                                                  color: AlmasaoodColors
                                                      .primaryColor,
                                                )),
                                          ),
                                        );
                                      }, childCount: 4),
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
      ),
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
                      tag: "id" + data.id.toString(),
                      child: Container(
                        child: data.images.isNotEmpty
                            ? Image.network(
                                data.images[0].file,
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
                      child: Text(
                          data.name(AppLocalizations.of(context).locale),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AlmasaoodColors.text))),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width > 330
                            ? MediaQuery.of(context).size.width / 4
                            : MediaQuery.of(context).size.width / 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Container(
                                color: AlmasaoodColors.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8, top: 2, bottom: 2),
                                  child: AutoSizeText(
                                    data.grade.name(
                                        AppLocalizations.of(context).locale),
                                    maxLines: 1,
                                    maxFontSize:
                                        MediaQuery.of(context).size.width > 330
                                            ? 14
                                            : 10,
                                    minFontSize: 8,
                                    style:
                                        TextStyle(color: AlmasaoodColors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                                    AppLocalizations.of(context).trans('AED'),
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

  Future<void> onRefersh() async {
    await Future.delayed(Duration(seconds: 2));


    initState();
//    bloc.f_grades();
//    bloc.f_getProducts();
    return null;

  }
}
