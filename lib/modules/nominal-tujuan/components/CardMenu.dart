import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/widgets/category_dart.dart';

class CardMenuNominalTujuan extends StatelessWidget {
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
            title: "Cari Dengan Kategori",
            svgSrc: "assets/icon/investasi.png",
            height: 100.0,
            width: 100.0,
          ),
          CategoryCard(
            title: "Cari Berdasarkan Nama",
            svgSrc: "assets/icon/rekomendasi.png",
            height: 100.0,
            width: 100.0,
          ),
          CategoryCard(
            title: "Cari Berdasarkan Nama",
            svgSrc: "assets/icon/rekomendasi.png",
            height: 100.0,
            width: 100.0,
          ),
          CategoryCard(
            title: "Cari Berdasarkan Nama",
            svgSrc: "assets/icon/rekomendasi.png",
            height: 100.0,
            width: 100.0,
          ),
        ],
      ),
    );
  }
}
