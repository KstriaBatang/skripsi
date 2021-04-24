import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app2/modules/dashboard/components/BottomNavigation.dart';

class ResultHitungBungamu extends StatelessWidget {
  final String nominal;
  final String interest;
  final String profit;
  final String days;

  ResultHitungBungamu({
    @required this.nominal,
    @required this.interest,
    @required this.profit,
    @required this.days,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationNavbar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0088f5),
                  Color(0xFF0277d4),
                  Color(0xFF01579B),
                ],
                begin: FractionalOffset.bottomRight,
                end: FractionalOffset.topLeft,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hasil",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/icon/profit.png'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * .2),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rp. $nominal",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "$interest%",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "$days hari",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Bunga yang didapat",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Rp. $profit",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
