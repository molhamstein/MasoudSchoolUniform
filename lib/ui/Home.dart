import 'package:flutter/material.dart';

import '../AlmasaoodColors.dart';
import 'ProductDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> s = ["All", "First Grade", "Secondary", "KG"];
  List<bool> checkedList = new List();

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  "assets/images/ic_cart.png",
                  scale: 1.5,
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Samar",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )
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
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: s.length,
                itemBuilder: (context, index) {
                  for (int i = 0; i < s.length; i++) checkedList.add(false);
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                for (int i = 0; i < s.length; i++) {
                                  checkedList[i] = (false);
                                  checkedList[index] = true;
                                }
                              });
                            },
                            child: Container(
                              color: checkedList[index] == false
                                  ? AlmasaoodColors.darkBlue
                                  : AlmasaoodColors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24, top: 8, bottom: 8),
                                child: Text(
                                  s[index],
                                  style: TextStyle(
                                      color: checkedList[index] == false
                                          ? AlmasaoodColors.white
                                          : AlmasaoodColors.lightBlue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetails()),
                      );

                    },child: ProductCard());
                  })),
        ],
      ),
    ));
  }

  Widget ProductCard() {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset("assets/images/child.png"),
              Text("Formal shirt-KG"),
              Row(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        child: Text("KG-1"),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
