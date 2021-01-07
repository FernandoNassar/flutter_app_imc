import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String valueImc;
  final String info;

  ResultText({this.valueImc, this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Text(
            valueImc,
            style: TextStyle(fontSize: 40.0, color: Colors.black87),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            info,
            style: TextStyle(fontSize: 32.0, color: Colors.black87),
          ),
        )
      ],
    );
  }
}
