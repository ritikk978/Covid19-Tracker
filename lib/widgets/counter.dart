import 'package:covid19/constant.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
    final Color color;
  final Color textColor;
  final String title;
  final String count;

  final Map worldData;

  const Counter({Key key, this.color, this.textColor, this.title, this.count, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$count",
            style: TextStyle(
              fontSize: 30,
              color: color,
            ),
            ),
            Text(title, style: kSubTextStyle)
      ],
    );
  }
}
