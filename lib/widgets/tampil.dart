import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';


class Tampil extends StatelessWidget {
  String nama;
  String link;
  String logo;
  String gambar;
  String bunga;
  String nominal;
  String buku;


  Tampil(String nama, String link, String logo, String gambar, String bunga,
      String nominal, String buku) {
    this.nama = nama;
    this.link = link;
    this.logo = logo;
    this.gambar = gambar;
    this.bunga = bunga;
    this.nominal = nominal;
    this.buku = buku;

  }

  launchURL() async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak bisa mengakses $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            height: size.height * .98,
            decoration: BoxDecoration(
              color: Color(0xFF01579B),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                margin:
                EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 30),
                height: size.height * .80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              margin: EdgeInsets.only(right: 30),
                              child: Image.asset(
                                logo,
                                height: 100,
                                width: 100,
                              )),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset(gambar),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            "Bunga Deposito : " + bunga,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            "Minimal Deposito : Rp." + nominal,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            "Jenis Buku : " + buku,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Align(
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {
                                launchURL();
                              },
                              child: Text(
                                "Klik Disini, Untuk info lebih lanjut",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
