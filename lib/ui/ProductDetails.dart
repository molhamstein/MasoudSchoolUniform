import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/local/AppLocal.dart';
import 'package:almasaood_app/models/ProductModel.dart';
import 'package:almasaood_app/models/productDetailsModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../AlmasaoodColors.dart';
import '../UserFeedBack.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with UserFeedback, TickerProviderStateMixin {
  Size sizeItem = new Size();
  int temp = 0;

  bool isFirst = true;

  List<bool> checkedList = [true];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AlmasaoodColors.pink,
          elevation: 0,
          iconTheme: IconThemeData(color: AlmasaoodColors.textDark),
        ),
        body: Container(
          color: AlmasaoodColors.pink,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Localizations(delegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                    locale: Locale('en', ''),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Stack(children: <Widget>[
                                Transform.rotate(
                                  angle: 5.8,
                                  child: Image.asset(
                                    "assets/images/sce_gary.png",
                                    height: MediaQuery.of(context).size.width / 4,
                                    width: MediaQuery.of(context).size.width / 4,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/sce_gray2.png",
                                  height: MediaQuery.of(context).size.width / 4,
                                  width: MediaQuery.of(context).size.width / 4,
                                )
                              ])
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder<ProductsModel>(
                      stream: bloc.productInfoStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 32,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                        3) *
                                                    2 -
                                                16,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data.name(
                                                  AppLocalizations.of(context)
                                                      .locale),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
//
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
//                                                      snapshot.data.getPrice(),
                                                      bloc.f_getProductPrice(
                                                              snapshot.data,
                                                              sizeItem.id) ??
                                                          snapshot.data
                                                              .getPrice(),
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .trans('AED'),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16,
                                                          color: AlmasaoodColors
                                                              .text),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .trans('type'),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color:
                                                        AlmasaoodColors.text),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color: AlmasaoodColors
                                                            .darkBlue,
                                                        blurRadius: 15.0,
                                                        spreadRadius: 1,
                                                        offset: Offset(0, 7),
                                                      ),
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Container(
                                                      color: AlmasaoodColors
                                                          .primaryColor,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 16.0,
                                                                right: 16,
                                                                top: 5,
                                                                bottom: 5),
                                                        child: Text(
                                                          snapshot.data.grade.name(
                                                              AppLocalizations.of(
                                                                      context)
                                                                  .locale),
                                                          style: TextStyle(
                                                              color:
                                                                  AlmasaoodColors
                                                                      .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color: snapshot.data
                                                                    .gender ==
                                                                "male"
                                                            ? AlmasaoodColors
                                                                .lightBlue
                                                            : AlmasaoodColors
                                                                .redWithOp,
                                                        blurRadius: 15.0,
                                                        spreadRadius: 1,
                                                        offset: Offset(0, 7),
                                                      ),
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Container(
                                                      color: snapshot.data
                                                                  .gender ==
                                                              "male"
                                                          ? AlmasaoodColors
                                                              .lightBlue
                                                          : AlmasaoodColors.red,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 16.0,
                                                                right: 16,
                                                                top: 5,
                                                                bottom: 5),
                                                        child: Text(
                                                          snapshot.data.genderT(
                                                              AppLocalizations.of(
                                                                      context)
                                                                  .locale),
                                                          style: TextStyle(
                                                              color:
                                                                  AlmasaoodColors
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3 -
                                                16,
                                        child: Column(
                                          children: <Widget>[
//                                  Image.network(""),

                                            Hero(
                                                tag: "id" +
                                                    snapshot.data.id.toString(),
                                                child: Container(
                                                  child: snapshot.data.images
                                                          .isNotEmpty
                                                      ? Image.network(
                                                          snapshot.data
                                                              .images[0].file,
                                                          height: 200,
                                                          width: 150,
                                                        )
                                                      : Image.asset(
                                                          "assets/images/child.png",
                                                          height: 200,
                                                          width: 150,
                                                        ),
                                                  decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 10,
                                                        offset: Offset(0, 8),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .trans('description'),
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: AlmasaoodColors
                                                      .primaryColor,
                                                  blurRadius: 5.0,
                                                  offset: Offset(0, 1),
                                                ),
                                              ],
                                            ),
                                            child: Container(
                                              color:
                                                  AlmasaoodColors.primaryColor,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              height: 3,
                                              child: Divider(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
//                                  child: Text(snapshot.data.descriptionEn),
                                          child: Text(
                                            snapshot.data.descriptionEn,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: AlmasaoodColors.text),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .trans('choose_size'),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: AlmasaoodColors
                                                    .primaryColor,
                                                blurRadius: 5.0,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            color: AlmasaoodColors.primaryColor,
                                            height: 3,
                                            child: Divider(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    child: StreamBuilder<List<Size>>(
                                        stream: bloc.productSizeStream,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData &&
                                              snapshot.data != null) {
                                            if (isFirst) {
                                              for (int i = 0;
                                                  i < snapshot.data.length;
                                                  i++) checkedList.add(false);

                                              checkedList[temp] = (false);
                                              checkedList[0] = true;
                                              sizeItem = snapshot.data[0];
                                              temp = 0;
                                              isFirst = false;
                                            }

                                            return ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
//
                                                          checkedList[temp] =
                                                              (false);
                                                          checkedList[index] =
                                                              true;

                                                          sizeItem = snapshot
                                                              .data[index];
                                                          temp = index;
                                                        });
                                                      },
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: 50.0,
                                                        lineWidth: 3.5,
                                                        percent: 1,
                                                        progressColor:
                                                            AlmasaoodColors
                                                                .primaryColor,
                                                        center: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          child: Container(
                                                            height: 44,
                                                            width: 44,
                                                            color: checkedList[
                                                                        index] ==
                                                                    false
                                                                ? AlmasaoodColors
                                                                    .pink
                                                                : AlmasaoodColors
                                                                    .primaryColor,
                                                            child: Center(
                                                              child: AutoSizeText(
                                                                snapshot
                                                                    .data[index]
                                                                    .code,minFontSize: 16,maxFontSize: 20,maxLines: 1,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,

                                                                    color: checkedList[index] ==
                                                                            false
                                                                        ? AlmasaoodColors
                                                                            .text
                                                                        : AlmasaoodColors
                                                                            .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          } else {
                                            return Container();
                                          }
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 24),
                                    child: StreamBuilder<String>(
                                        stream: bloc.feedbackStream,
                                        builder: (context, snapshotStatus) {
                                          if (snapshotStatus.hasData &&
                                              bloc.showFeedback == true) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              showInSnackBar(
                                                  snapshotStatus.data, context,
                                                  color: AlmasaoodColors
                                                      .primaryColor);
                                              bloc.showFeedback = false;
                                            });
                                          } else if (snapshotStatus.hasError &&
                                              bloc.showFeedback == true) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              showInSnackBar(
                                                  snapshotStatus.error,
                                                  context);
                                              bloc.showFeedback = false;
                                            });
                                          }

                                          return MainButton(
                                            onPressed: () {
                                              if (sizeItem.id != null) {
                                                bloc.f_addToCart(
                                                    new ProductDetailsModel(
                                                        bloc.f_getProductId(
                                                            snapshot.data,
                                                            sizeItem.id),
                                                        Images(
                                                            file: snapshot
                                                                    .data
                                                                    .images
                                                                    .isEmpty
                                                                ? ""
                                                                : snapshot
                                                                    .data
                                                                    .images[0]
                                                                    .file),
                                                        snapshot.data.nameEn,
                                                        snapshot.data.nameAr,
                                                        bloc.f_getProductPrice(
                                                                snapshot.data,
                                                                sizeItem.id) ??
                                                            snapshot.data
                                                                .getPrice(),
                                                        Grade(
                                                            nameEn: snapshot
                                                                .data
                                                                .grade
                                                                .nameEn,
                                                            nameAr: snapshot
                                                                .data
                                                                .grade
                                                                .nameAr),
                                                        snapshot.data.gender,
                                                        Size(
                                                            code:
                                                                sizeItem.code),
                                                        1),
                                                    context);
                                              } else {
                                                print("No size detacted");
                                                showInSnackBar(
                                                    AppLocalizations.of(context)
                                                        .trans(
                                                            'no_size_detected'),
                                                    context);
                                              }
//                                bloc.f_getProductId(snapshot.data ,sizeId);
                                            },
                                            text: AppLocalizations.of(context)
                                                .trans('add_to_cart'),
                                            textColor: AlmasaoodColors.white,
                                            color: AlmasaoodColors.primaryColor,
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
