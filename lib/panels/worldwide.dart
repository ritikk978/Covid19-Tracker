import 'package:covid19/constant.dart';
import 'package:covid19/widgets/counter.dart';
import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 4),
        //     blurRadius: 30,
        //     color: kShadowColor,
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Counter(
            color: kInfectedColor,
            count: worldData['cases'].toString(),
            title: "Confirmed",
          ),

          Counter(
            color: kRecovercolor,
            count: worldData['recovered'].toString(),
            title: "Recovered",
          ),
          Counter(
            color: kDeathColor,
            count: worldData['deaths'].toString(),
            title: "Deaths",
          ),
        ],
      ),
    );
  }
}

