import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app2/modules/cek-investasi/CekInvestasi.dart';
import 'package:flutter_app2/modules/hitung-bungamu/HitungBungamu.dart';
import 'package:flutter_app2/modules/yuk-nabung/YukNabung.dart';
import 'package:flutter_app2/widgets/category_dart.dart';

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
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => YukNabung()));
            },
          ),
          CategoryCard(
            title: "Hitung Bunga",
            svgSrc: "assets/icon/profit.png",
            height: 100.0,
            width: 100.0,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HitungBungamu()));
            },
          ),
          CategoryCard(
            title: "Cek Tempat Investasimu",
            height: 100.0,
            width: 100.0,
            svgSrc: "assets/icon/search.png",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CekInvestasi()));
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
