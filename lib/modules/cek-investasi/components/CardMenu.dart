import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/modules/search-by-category/SearchByCategory.dart';
import 'package:flutter_app2/modules/search-by-name/SearchByName.dart';

import 'package:flutter_app2/utils/category_dart.dart';

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
            title: "Cari Dengan Kategori",
            svgSrc: "assets/icon/investasi.png",
            height: 90.0,
            width: 90.0,
            press: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => SearchByCategoryPage())),
          ),
          CategoryCard(
            title: "Cari Berdasarkan Nama",
            svgSrc: "assets/icon/rekomendasi.png",
            height: 90.0,
            width: 90.0,
            press: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => SearchByNamePage())),
          ),
        ],
      ),
    );
  }
}
