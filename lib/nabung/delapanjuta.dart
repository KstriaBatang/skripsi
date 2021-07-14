import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/nabung/kategori_nabung.dart';
import 'package:flutter_app2/nabung/ykdata.dart';
import 'package:flutter_app2/nabung/yktampil.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class Delapanjuta extends StatelessWidget {
  Delapanjuta({@required this.h_tujuan, @required this.h_nominal});

  final int h_tujuan;
  final int h_nominal;

  List<ykdata> data = [
    ykdata("Mandiri", "assets/icon/mandiri.png", 3.5),
    ykdata("BRI", "assets/icon/bri.png", 3.5),
    ykdata("CIMB Niaga", "assets/icon/cimb.png", 3),
    ykdata("BCA", "assets/icon/bca.png", 2.85),
    ykdata("OCBC", "assets/icon/ocbc.png", 2.75),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset("assets/icon/home.svg"),
                      Text("Home"),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return biodata();
                      }),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                          height: 32.0,
                          width: 32.0,
                          alignment: Alignment.center,
                          child: SvgPicture.asset("assets/icon/profile.svg")),
                      Text("Profile"),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Settings();
                      }),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 32.0,
                          width: 32.0,
                          alignment: Alignment.center,
                          child: SvgPicture.asset("assets/icon/settings.svg")),
                      Text("Settings"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF01579B),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Align(
                              // alignment : Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "Yuk Nabung",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  height: 64.0,
                                  width: 64.0,
                                  child:
                                  SvgPicture.asset("assets/icon/plan.svg")),
                            ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .85,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        scrollDirection : Axis.vertical,
                        itemBuilder: (BuildContext context, index) =>
                            Kategorinabung(
                              title: "Bank "+ data[index].nama,
                              ImgSrc: data[index].logo,
                              height: 128.0,
                              width: 128.0,
                              press: () {
                                var route = new MaterialPageRoute(
                                  builder: (BuildContext) => new Yktampil(
                                    data[index].nama,
                                    data[index].logo,
                                    data[index].bunga,
                                    h_tujuan,
                                    h_nominal,
                                  ),
                                );
                                Navigator.of(context).push(route);
                              },
                            ),
                        itemCount: data.length,
                      ),
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
