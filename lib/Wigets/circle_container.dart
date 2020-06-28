import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final String foodName;
  final String foodType;
  final double price;
  final double ratingPoint;
  final Function whenPress;
  CircleContainer(
      {this.whenPress,
      this.foodName,
      this.foodType,
      this.price,
      this.ratingPoint});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: whenPress,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: 200,
              width: 175,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 2, top: 95),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      foodType,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xfff9c630),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            " ${ratingPoint.toString()}",
                            style: TextStyle(fontSize: 12),
                          ),
                          Container(
                            width: 108,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Resthing",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(
                                  "\$ ${price.toString()}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).accentColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: whenPress,
            child: Padding(
              padding: EdgeInsets.only(left: 90),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/chicken.jpg"),
                radius: 62,
                backgroundColor: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
