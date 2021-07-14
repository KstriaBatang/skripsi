import 'package:flutter/material.dart';
import 'package:flutter_app2/constants.dart';
import 'package:flutter_app2/scenes/rekomendasi.dart';
import 'package:flutter_app2/widgets/kategori.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/main.dart';

class cekinvestasi extends StatelessWidget {
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
                Container(
                    height: 32.0,
                    width: 32.0,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/icon/profile.svg")),
                Text("Profile"),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              " \n Cek Tempat \n Investasimu \n",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            // child: Container(
                            //   height: 52,
                            //   width: 52,
                            //   decoration: BoxDecoration(
                            //     color: Color(0xFF0288D1),
                            //     shape: BoxShape.circle,
                            //   ),
                            child: Container(
                                height: 64.0,
                                width: 64.0,
                                child:
                                    SvgPicture.asset("assets/icon/search.svg")),
                          ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return kategori();
                                }),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Spacer(),
                                SvgPicture.asset("assets/icon/investasi.svg"),
                                Spacer(),
                                Text(
                                  "Cek Nama\nInvestasimu",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return rekomendasi();
                                }),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Spacer(),
                                Container(
                                    height: 64.0,
                                    width: 64.0,
                                    child: SvgPicture.asset(
                                        "assets/icon/rekomendasi.svg")),
                                Spacer(),
                                Text(
                                  "Rekomendasi\nInvestasi",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
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
