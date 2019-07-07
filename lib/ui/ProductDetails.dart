import 'package:almasaood_app/Widgets/MainButton.dart';
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
        body: SingleChildScrollView(
          child: Container(
      decoration: BoxDecoration(
          color: AlmasaoodColors.pink,
          image: DecorationImage(
              image: ExactAssetImage(
                "assets/images/bg_MeasureTape.png",
              ),
              alignment: FractionalOffset.topRight),
      ),
      child: Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 16, right: 16),
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width / 3) * 2 - 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Formal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text(
                            "TROUSER/SHORT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                children: <Widget>[Text("200"), Text("AED")],
                              )
                            ],
                          ),
                          Text("Type"),
                          Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: AlmasaoodColors.darkBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, right: 24, top: 8, bottom: 8),
                                    child: Text(
                                      "KG-1",
                                      style:
                                          TextStyle(color: AlmasaoodColors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: AlmasaoodColors.lightBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, right: 24, top: 8, bottom: 8),
                                    child: Text(
                                      "Male",
                                      style:
                                          TextStyle(color: AlmasaoodColors.white),
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
                          Image.asset("assets/images/child.png")
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Description"),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: AlmasaoodColors.darkBlue,
                      width: MediaQuery.of(context).size.width / 2,
                      height: 2,
                      child: Divider(),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                        child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                    )),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Choose Size"),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: AlmasaoodColors.darkBlue,
                      height: 2,
                      child: Divider(),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: 1,
                          progressColor: AlmasaoodColors.darkBlue,
                          center: Text("L"),
                        );
                      }),
                ),
                MainButton(
                  onPressed: () {},
                  text: "Add To Cart",
                  textColor: AlmasaoodColors.white,
                  color: AlmasaoodColors.darkBlue,
                )
              ],
            ),
          ),
      ),
    ),
        ));
  }
}
