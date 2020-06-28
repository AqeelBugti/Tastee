import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './logIn.dart';
import '../Wigets/MyTextFromField.dart';
import '../Wigets/RaisedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/user.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  File cameraImage;
  bool _gender = false;
  bool _isMale = true;
  Future getImage() async {
    final getImage = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      cameraImage = File(getImage.path);
    });
  }

  AuthResult authResult;

  RegExp regex = new RegExp(SignUp.pattern);

  final GlobalKey<ScaffoldState> _myKey = GlobalKey<ScaffoldState>();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController fullName = TextEditingController();

  final TextEditingController contactNumber = TextEditingController();

  final TextEditingController gender = TextEditingController();

  final TextEditingController address = TextEditingController();

  void submit() async {
    try {
      setState(() {
        _isLoading = true;
      });
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      final ref = FirebaseStorage.instance
          .ref()
          .child("user _image")
          .child(authResult.user.uid + '.jpg');

      await ref.putFile(cameraImage).onComplete;
      final url = await ref.getDownloadURL();
      User user = User(
        fullName: fullName.text,
        email: email.text,
        password: password.text,
        contactNumber: contactNumber.text,
        address: address.text,
        gender: _isMale ? "Male" : "Female",
        image: cameraImage,
      );

      Firestore.instance
          .collection("user")
          .document(authResult.user.uid)
          .setData({
        'userName': user.fullName,
        'email': user.email,
        'password': user.password,
        'contactNumber': user.contactNumber,
        'gender': user.gender,
        'address': user.address,
        'user_image': url,
      });
      snackBarValidation();
    } on PlatformException catch (err) {
      var message = 'Please check your internet';
      if (err.message != null) {
        message = err.message;
      }
      _myKey.currentState.showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
      _myKey.currentState.showSnackBar(SnackBar(
        content: Text(err),
      ));
    }
  }

  void snackBarValidation() {
    if (cameraImage == null) {
      _myKey.currentState
          .showSnackBar(SnackBar(content: Text(" Pick a image")));
      return;
    }
    if (email.text.isEmpty && password.text.isEmpty) {
      _myKey.currentState
          .showSnackBar(SnackBar(content: Text("Both field are empty")));
      return;
    } else if (email.text.isEmpty || email.text.trim() == null) {
      _myKey.currentState
          .showSnackBar(SnackBar(content: Text("Email is Emptey")));
      return;
    }
    if (regex.hasMatch(email.text) == false) {
      _myKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            'Please enter valid email',
          ),
        ),
      );
      return;
    }
    if (password.text.isEmpty || password.text.trim() == null) {
      _myKey.currentState
          .showSnackBar(SnackBar(content: Text("Password is Emptey")));
      return;
    }
    if (password.text.length < 8) {
      _myKey.currentState.showSnackBar(
          SnackBar(content: Text("Pasword Must be greater then 8")));

      return;
    }
    if (address.text.isEmpty || address.text.isEmpty) {
      _myKey.currentState
          .showSnackBar(SnackBar(content: Text("Both field are empty")));
      return;
    }
    submit();
  }

  Widget _signUpCreateAnAccountText() {
    return Container(
      height: 130,
      width: 390,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Create an account",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                    radius: 46,
                    backgroundColor: Colors.yellow,
                    backgroundImage: cameraImage == null
                        ? AssetImage("images/chicken.jpg")
                        : FileImage(cameraImage))),
          ),
        ],
      ),
    );
  }

  Widget _allTextField() {
    return Container(
      height: 460,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFromField(
            hintText: 'Full Name',
            keybord: TextInputType.emailAddress,
            myObscureText: false,
            myController: fullName,
          ),
          MyTextFromField(
            hintText: 'Email',
            keybord: TextInputType.emailAddress,
            myObscureText: false,
            myController: email,
          ),
          MyTextFromField(
            hintText: 'Contact Number',
            keybord: TextInputType.emailAddress,
            myObscureText: false,
            myController: contactNumber,
          ),
          MyTextFromField(
            hintText: 'Password',
            keybord: TextInputType.emailAddress,
            myObscureText: true,
            myController: password,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _gender = !_gender;
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 12),
              height: 60,
              width: double.infinity,
              child: Text(
                _gender ? "Female" : "Male",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              decoration: BoxDecoration(
                  color: Color(0xfffef6fa),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          MyTextFromField(
            hintText: 'Address',
            keybord: TextInputType.emailAddress,
            myObscureText: false,
            myController: address,
          ),
        ],
      ),
    );
  }

  Widget _alreadyHaveAnAccoutLogInText(context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (!_isLoading)
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _raisedButton(context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: MyRaisedutton(
        buttonText: 'SignUp',
        myColor: Theme.of(context).primaryColor,
        whenPress: () {
          snackBarValidation();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _myKey,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _signUpCreateAnAccountText(),
                ],
              ),
              _allTextField(),
              Container(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (_isLoading)
                      CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    if (!_isLoading) _raisedButton(context),
                    _alreadyHaveAnAccoutLogInText(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
