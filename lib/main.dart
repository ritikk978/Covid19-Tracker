import 'package:covid19/constant.dart';
// import 'package:covid19/widgets/info_screen.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      // fontFamily: "Poppins",
      textTheme: TextTheme(
        body1: TextStyle(color: kBodyTextColor),
      )
      // primaryColor: primaryBlack
    ),
    home: HomePage(),
  ));
}