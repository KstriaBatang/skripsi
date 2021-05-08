import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ListMonthly extends StatelessWidget {
  final bool first;
  final bool last;
  final int currentMonthNominal;
  final String month;
  final String name;
  final String pic;

  ListMonthly({
    @required this.first,
    @required this.last,
    @required this.currentMonthNominal,
    @required this.month,
    @required this.name,
    @required this.pic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: first ? 0 : 5,
        bottom: last ? 0 : 5,
        left: 5,
        right: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 0.5),
              spreadRadius: 0.1,
              blurRadius: 3.0,
            )
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              child: Text(
                month,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xABFA75DB),
                    Color(0xEBFA75DB),
                    Color(0xEAFA75DB),
                  ],
                  begin: FractionalOffset.bottomRight,
                  end: FractionalOffset.topLeft,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(name),
                      Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(pic),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Text('Rp. ${NumberFormat("#,##0").format(currentMonthNominal).toString()}')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
