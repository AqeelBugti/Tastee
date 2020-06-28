import 'package:flutter/material.dart';
import './homepage.dart';
import '../Wigets/circle_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/food_model.dart';

class FoodCatagory extends StatefulWidget {
  @override
  _FoodCatagoryState createState() => _FoodCatagoryState();
}

class _FoodCatagoryState extends State<FoodCatagory> {
  Food food;
  Secondfood secondfood;
  Widget _pastaCheese() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CircleContainer(
            foodName: food.foodName,
            foodType: food.foodType,
            foodRating: food.rating,
            foodPrice: food.price,
            foodImage: food.image,
          ),
          CircleContainer(
            foodName: secondfood.foodName,
            foodType: secondfood.foodType,
            foodRating: secondfood.rating,
            foodPrice: secondfood.price,
            foodImage: secondfood.image,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection('food')
        .document("pjCgmWbz6hw0Cto4uBCh")
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
            reathings: event["reatings"],
            image: event["image"]);
      });
    });

    Firestore.instance
        .collection('food')
        .document("Vbj26j21QGsTtu5Qf9ca")
        .snapshots()
        .listen((event) {
      print(event['foodPrice']);
      // print(event['foodName']);
      setState(() {
        secondfood = Secondfood(
            foodName: event["foodName"],
            foodType: event["foodType"],
            price: event["foodPrice"],
            rating: event["rating"],
            reathings: event["Reatings"],
            image: event["image"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: Text(
          "Pizza",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
            _pastaCheese(),
          ],
        ),
      ),
    );
  }
}
