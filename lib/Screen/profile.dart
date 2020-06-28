import 'package:flutter/material.dart';
import './homepage.dart';
import '../Wigets/RaisedButton.dart';
import '../Wigets/MyTextFromField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool profileCondition = false;
  File cameraImage;

  Future getImage() async {
    final getImage = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      cameraImage = File(getImage.path);
    });
  }

  Widget _textFormField({String hintText, context}) {
    return MyTextFromField(
      hintText: hintText,
      keybord: TextInputType.emailAddress,
      myObscureText: false,
    );
  }

  Widget _raisedButton(context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: MyRaisedutton(
        buttonText: 'Update',
        textColor: Colors.white,
        myColor: Theme.of(context).primaryColor,
        whenPress: () {},
      ),
    );
  }

  Widget _circleWidet() {
    return Padding(
      padding: EdgeInsets.only(top: 65, left: 150),
      child: CircleAvatar(
        maxRadius: 70,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          maxRadius: 66,
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage("images/Kartik.jpg"),
        ),
      ),
    );
  }

  Widget _editedIcon() {
    return Container(
      padding: EdgeInsets.only(top: 144, left: 130),
      child: Align(
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              getImage();
            },
          ),
        ),
      ),
    );
  }

  Widget _myfalseContainer({String fieldName}) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 5),
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 13),
      height: 60,
      width: double.infinity,
      child: Text(
        fieldName,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
      ),
      decoration: BoxDecoration(
          color: Color(0xfffef6fa), borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0.0,
        leading: profileCondition==false ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ):IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            setState(() {
              profileCondition=false; 
            });
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                profileCondition=true;
              });
            },
            icon: Text("Edit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 730,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 430,
                              child: profileCondition == true
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        _textFormField(
                                            hintText: 'Email',
                                            context: context),
                                        _textFormField(
                                            hintText: 'Password',
                                            context: context),
                                        _textFormField(
                                            hintText: 'Contact Number',
                                            context: context),
                                        _textFormField(
                                            hintText: 'Female',
                                            context: context),
                                        _textFormField(
                                            hintText: 'Address',
                                            context: context),
                                      ],
                                    )
                                  : Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          _myfalseContainer(fieldName: 'Email'),
                                          _myfalseContainer(
                                              fieldName: 'Password'),
                                          _myfalseContainer(
                                              fieldName: 'Contact Number'),
                                          _myfalseContainer(
                                              fieldName: 'Female'),
                                          _myfalseContainer(
                                              fieldName: 'Address'),
                                        ],
                                      ),
                                    ),
                            ),
                            profileCondition == true
                                ? _raisedButton(context)
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _circleWidet(),
            profileCondition == true ? _editedIcon() : Container(),
          ],
        ),
      ),
    );
  }
}
