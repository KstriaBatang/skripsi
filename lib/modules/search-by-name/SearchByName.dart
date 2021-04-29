import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app2/modules/dashboard/components/BottomNavigation.dart';
import 'package:flutter_app2/modules/search-by-name/components/Form.dart';

class SearchByNamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          "Cari Berdasarkan \nNama",
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
                          child: Image.asset('assets/icon/rekomendasi.png'),
                        ),
                      ],
                    ),
                  ),
                  FormSearchByName(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
