import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Yktampil extends StatefulWidget {
  String nama;
  String logo;
  double bunga;
  int h_nominal;
  int h_tujuan;
  List<double> hasilHari = [];
  List<String> bulanKe = [];

  Yktampil(
      String nama, String logo, double bunga, int h_tujuan, int h_nominal) {
    this.nama = nama;
    this.logo = logo;
    this.bunga = bunga;
    this.h_tujuan = h_tujuan;
    this.h_nominal = h_nominal;
  }

  hitung(int tujuan, int nominal, double bungas) {
    double j;
    double hasil = 0;
    double hasil1 = 0;
    j = (tujuan / nominal);

    for (int i = 1; i < j; i++) {
      hasil = (nominal.toDouble() *
          (bungas / 100) *
          (80 / 100) /
          365 *
          (i).toDouble() *
          30);
      hasilHari.add(hasil);
      bulanKe.add(i.toString());
      print("hasil ke -" + i.toString() + " adalah " + hasil.toString());
      hasil1 = hasil1 + hasil;
      print(hasil1.toString());
    }
    return hasil1;
  }

  hari(int tujuan, int nominal) {
    double k = (tujuan.toDouble() / nominal.toDouble());
    return k;
  }

  total(int nominal, int tujuan, double bunga) {
    double hasil = 0;
    double hasil1 = 0;
    double j;
    double totals;
    double finaltotal;

    j = tujuan.toDouble() / nominal.toDouble();
    totals = nominal * j;
    for (int i = 1; i < j; i++) {
     hasil = (nominal.toDouble() * (bunga / 100) * (80 / 100) / 365 * (i).toDouble() * 30);
     hasil1 = hasil1 + hasil;
    }
    finaltotal = hasil1 + totals;
    return finaltotal;
  }

  @override
  _YktampilState createState() => _YktampilState();
}

class _YktampilState extends State<Yktampil> {
  final money = NumberFormat("#,##0", "en_us");

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
            ],
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
                            widget.logo,
                            height: 100,
                            width: 100,
                          )),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Nominal Tujuan : Rp." +
                            money.format(int.parse(widget.h_tujuan.toString())),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Nominal Setiap Bulan : Rp." +
                            money
                                .format(int.parse(widget.h_nominal.toString())),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Suku Bunga : " + widget.bunga.toString() +"%",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Total Bunga : Rp." +
                            money.format(widget.hitung(widget.h_tujuan,
                                widget.h_nominal, widget.bunga)),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                          "Perhitungan akan tercapai selama " +
                              money.format(double.parse(widget
                                  .hari(widget.h_tujuan, widget.h_nominal)
                                  .toString())) +
                              " bulan.",
                          style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                          "Total Keseluruhan : Rp." +money.format(widget.total(widget.h_nominal, widget.h_tujuan, widget.bunga)),
                          style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                          "Perincian Perhitungan Bunga :",
                          style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 380,left: 20, bottom: 50),
            child: ListView.builder(
              itemCount: widget.hasilHari.length,
              itemBuilder: (context, index) => Text(
                    widget.bulanKe[index] +
                    " x Rp." + money.format(widget.h_nominal) + " = Rp." +
                    money.format((widget.hasilHari[index])).toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
