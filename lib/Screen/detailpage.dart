import 'package:flutter/material.dart';
import './homepage.dart';
import '../Wigets/RaisedButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/food_model.dart';
class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;
  Food food;
  Widget _chickenBrostWidget({context,String foodName,String foodType}) {
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            foodName,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          Text(
            foodType,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
  
  Widget _countAndPrice(context) {
    return Container(
      height: 40,
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "\$123",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffebfcfe),
                borderRadius: BorderRadius.circular(10)),
            height: 30,
            width: 80,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 16,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      setState(() {
                        if (count >1) {
                          count--;
                        }
                      });
                    },
                  ),
                ),
                Text(
                  "${count.toString()}",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 16,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _weightAndkg(context) {
    return Container(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Weight",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Mix together",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            width: 394,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "12kg",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  "Eggs, Milk, dip",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _coloriesAndCcal(context) {
    return Container(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 398,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Colories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Chicken in this",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            width: 338,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "430 ccal",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  "Mixture",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _raisedButton(context) {
    return Container(
      height: 60,
      width: 400,
      child: MyRaisedutton(
        buttonText: "Submit",
        textColor: Colors.white,
        myColor: Theme.of(context).primaryColor,
        whenPress: () {},
      ),
    );
  }

  Widget _circle({String image}) {
    return Padding(
      padding: EdgeInsets.only(left: 90),
      child: CircleAvatar(
        backgroundImage: NetworkImage(image),
        radius: 140,
      ),
    );
  }
   
 @override
  void initState() {
    super.initState();

      Firestore.instance
          .collection('food')
          .document("cy8NaZqapxmsynmY33IP")
          .snapshots()
          .listen((event) {
        print(event['foodPrice']);
        // print(event['foodName']);
        setState(() {
            food = Food(
          foodName: event["foodName"],
          foodType: event["foodtitle"],
          price: event["foodPrice"],
          rating: event["rating"],
          reathings: event["Reatings"],
          image: event["image"],
        );
      });
        });
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xfffef6fa),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
            return;
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    width: 440,
                    height: 660,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 600,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                             _chickenBrostWidget(context: context,foodName: food.foodName,foodType: food.foodType),
                              _countAndPrice(context),
                              _weightAndkg(context),
                              _coloriesAndCcal(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 170,
                    color: Color(0xfffef6fa),
                  ),
                  _circle(
                    image:food.image 
                  ),
                ],
              ),
              _raisedButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
