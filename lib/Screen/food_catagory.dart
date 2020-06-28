import 'package:flutter/material.dart';
import './homepage.dart';
import '../Wigets/circle_container.dart';

class FoodCatagory extends StatelessWidget {
  Widget _pastaCheese() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CircleContainer(
            foodName: 'Pasta Cheese',
            foodType: '7 Ocean Hotal',
            ratingPoint: 23,
            price: 20,
          ),
          CircleContainer(
            foodName: 'Pasta Cheese',
            foodType: '7 Ocean Hotal',
            ratingPoint: 23,
            price: 20,
          ),
        ],
      ),
    );
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
