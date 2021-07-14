import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app2/main.dart';
import 'package:intl/intl.dart';

class bungahitung extends StatelessWidget {
  final money = NumberFormat("#,##0", "en_us");

  bungahitung(
      {@required this.h_bunga,
      @required this.h_hari,
      @required this.h_nominal});

  final double h_bunga;
  final int h_hari;
  final int h_nominal;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var hasil = (h_nominal * (h_bunga / 100) * (80 / 100) / 365 * h_hari);
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
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF01579B),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Hasil \nPerhitungan ",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 64,
                        width: 64,
                        child: SvgPicture.asset("assets/icon/investasi.svg"),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "\n \nNominal Anda :",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontFamily: "CrashLandingBB"),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            "Rp. "+ money.format(h_nominal),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: "CrashLandingBB",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Nilai Bunga Anda :",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: "CrashLandingBB"),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            h_bunga.toString() + " %",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: "CrashLandingBB"),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Total Bunga :',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: "CrashLandingBB"),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Rp. "+ money.format(double.parse(hasil.toString())),
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: "CrashLandingBB"),
                        ),
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
