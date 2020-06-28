import 'package:flutter/material.dart';
import './homepage.dart';
import '../Wigets/RaisedButton.dart';

class Cart extends StatelessWidget {
  Widget _cartWiget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          child: ListTile(
            leading: Container(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/chicken.jpg"),
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(left: 4),
              child: Row(
                children: <Widget>[
                  Text(
                    "1x",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Pasta Cheese",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "7 Oceans Hostal",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            trailing: Text(
              " \$ 20",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _totalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Total",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "\$360",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              return;
            }),
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    _cartWiget(context),
                    _cartWiget(context),
                    _cartWiget(context),
                    _cartWiget(context),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(28),
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _totalPrice(),
                    Container(
                      height: 60,
                      width: double.infinity,
                      child: MyRaisedutton(
                        buttonText: 'Submit',textColor: Theme.of(context).primaryColor,
                        myColor: Colors.white,
                        whenPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
