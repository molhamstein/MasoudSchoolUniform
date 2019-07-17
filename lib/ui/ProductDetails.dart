import 'package:almasaood_app/Widgets/MainButton.dart';
import 'package:almasaood_app/bloc/GeneralBloc.dart';
import 'package:almasaood_app/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../AlmasaoodColors.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AlmasaoodColors.pink,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(
                  "assets/images/bg_MeasureTape.png",
                ),
                alignment: FractionalOffset.topRight),
          ),
          child: StreamBuilder<ProductsModel>(
              stream: bloc.productInfoStream,
              builder: (context, snapshot) {
                if(snapshot.hasData && snapshot.data != null ){

                return Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 16, right: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width / 3) * 2 -
                                      16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.nameEn,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
//                                Text(
//                                  "TROUSER/SHORT",
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold, fontSize: 22),
//                                ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data.price,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "AED",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text("Type"),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          color: AlmasaoodColors.darkBlue,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24.0,
                                                right: 24,
                                                top: 8,
                                                bottom: 8),
                                            child: Text(
                                            snapshot.data.grade.nameEn,
                                              style: TextStyle(
                                                  color: AlmasaoodColors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          color: AlmasaoodColors.lightBlue,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16.0,
                                                right: 16,
                                                top: 8,
                                                bottom: 8),
                                            child: Text(
                                             snapshot.data.gender,
                                              style: TextStyle(
                                                  color: AlmasaoodColors.white),
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
                              width: MediaQuery.of(context).size.width / 3 - 16,
                              child: Column(
                                children: <Widget>[
//                                  Image.network(""),

                                  Image.asset("assets/images/child.png", height: 200,)
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                color: AlmasaoodColors.darkBlue,
                                width: MediaQuery.of(context).size.width / 2,
                                height: 2,
                                child: Divider(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                   snapshot.data.descriptionEn),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text("Choose Size"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                color: AlmasaoodColors.darkBlue,
                                height: 2,
                                child: Divider(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          child: StreamBuilder<List<Size>>(
                            stream: bloc.productSizeStream,
                            builder: (context, snapshot) {
                              if(snapshot.hasData && snapshot.data!= null) {
                              print("lenght is  : "+snapshot.data.length.toString() );

                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: CircularPercentIndicator(
                                        radius: 50.0,
                                        lineWidth: 3.5,
                                        percent: 1,
                                        progressColor: AlmasaoodColors.darkBlue,
                                        center: Text(
                                          snapshot.data[index].code,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: AlmasaoodColors.textDark),
                                        ),
                                      ),
                                    );
                                  });}else {return Container();}
                            }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                          child: MainButton(
                            onPressed: () {},
                            text: "Add To Cart",
                            textColor: AlmasaoodColors.white,
                            color: AlmasaoodColors.darkBlue,
                          ),
                        )
                      ],
                    ),
                  ),
                );}else {

                  return Container();
                }
              }),
        ),
      ),
    ));
  }
}
