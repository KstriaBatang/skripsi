import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app2/widgets/category_dart.dart';
import 'package:flutter_app2/scenes/cekinvestasi.dart';

class CardMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .85,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: <Widget>[
          CategoryCard(
            title: "Yuk Nabung",
            svgSrc: "assets/icon/investasi.png",
            height: 100.0,
            width: 100.0,
          ),
          CategoryCard(
            title: "Hitung Bunga",
            svgSrc: "assets/icon/profit.png",
            height: 100.0,
            width: 100.0,
          ),
          CategoryCard(
            title: "Cek Tempat Investasimu",
            height: 100.0,
            width: 100.0,
            svgSrc: "assets/icon/search.png",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cekinvestasi()),
              );
            },
          ),
          CategoryCard(
            title: "Belajar Nabung Yuk",
            svgSrc: "assets/icon/education.png",
            height: 100.0,
            width: 100.0,
          ),
        ],
      ),
    );
  }
}
