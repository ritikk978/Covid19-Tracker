import 'dart:convert';

import 'package:covid19/constant.dart';
import 'package:covid19/pages/countryPage.dart';
import 'package:covid19/panels/infoPanel.dart';
import 'package:covid19/panels/mosteffectedcountries.dart';
import 'package:covid19/panels/worldwide.dart';
import 'package:covid19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'panels/worldwide.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
    void initState(){
      fetchWorldWideData();
      fetchCountryData();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyHeader(
          image: "assets/icons/Drcorona.svg",
          textTop: "All you need",
          textBottom: "is stay at home",
        ),
        SizedBox(height: 20),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget> [
          Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Case Update\n",
                    style: kTitleTextstyle,
                  ),
                  
                ],
              )
            ),
            Spacer(),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));

                },
                child: Text(
                "See all Countries",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
            ),
          ],
          ),
          ],
        ),
        ),
         worldData == null? CircularProgressIndicator():WorldwidePanel(worldData: worldData,),

        
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 5),
          child: Text('Most affected Countries', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        ),
        // SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(20),
          height: 178,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 30,
                color: kShadowColor,
              ),
            ],
          ),
          child: Image.asset("assets/images/map.png",
          fit: BoxFit.contain),
        ),
        // SizedBox(height: 10.0),
        countryData== null?Container():MostAffectedPanel(countryData: countryData,),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: InfoPanel(),
        ),
        SizedBox(height: 20,),
        Center(child: Text('WE ARE TOGETHER IN THE FIGHT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
        SizedBox(height: 50,)
      ],
      )
    ),
    );
      
    
  }
}

