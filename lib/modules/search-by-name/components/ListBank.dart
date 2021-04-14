import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListBank extends StatelessWidget {
  final String bankName;
  final String pict;
  final Function press;

  ListBank({
    @required this.bankName,
    @required this.pict,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 1.0),
            spreadRadius: 0.1,
            blurRadius: 4.0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press ?? () {},
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Text(bankName),
                Spacer(),
                Image.asset(
                  pict,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
