import 'dart:io';
import 'package:flutter/material.dart';
class User {
  String fullName;
  String email;
  String password;
  String contactNumber;
  String gender;
  String address;
  File image;
  User(
    {
   @required this.fullName,
   @required this.email,
   @required this.password,
   @required this.contactNumber,
   @required this.gender,
   @required this.address,
    @required this.image,
    }
  );

}