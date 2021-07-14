import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/nabung/delapanjuta.dart';
import 'package:flutter_app2/nabung/limajuta.dart';
import 'package:flutter_app2/nabung/limit.dart';
import 'package:flutter_app2/nabung/limitkecil.dart';
import 'package:flutter_app2/nabung/satujuta.dart';
import 'package:flutter_app2/nabung/sepuluhjuta.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/currency.dart';

class yuknabung extends StatefulWidget {
  const yuknabung({Key key}) : super(key: key);

  @override
  _yuknabungState createState() => _yuknabungState();
}

class _yuknabungState extends State<yuknabung> {
  int tujuan;
  int nominal;

  Future hasil() async {
    if (nominal == 1000000) {
      var route = new MaterialPageRoute(
        builder: (BuildContext) =>
            new Satujuta(h_tujuan: tujuan, h_nominal: nominal),
      );
      Navigator.of(context).push(route);
    } else if (1000000 <= nominal && nominal < 5000000) {
      var route = new MaterialPageRoute(
        builder: (BuildContext) =>
            new Satujuta(h_tujuan: tujuan, h_nominal: nominal),
      );
      Navigator.of(context).push(route);
    } else if (5000000 <= nominal && nominal < 8000000) {
      var route = new MaterialPageRoute(
        builder: (BuildContext) =>
            new Limajuta(h_tujuan: tujuan, h_nominal: nominal),
      );
      Navigator.of(context).push(route);
    } else if (8000000 <= nominal && nominal < 10000000) {
      var route = new MaterialPageRoute(
        builder: (BuildContext) =>
            new Delapanjuta(h_tujuan: tujuan, h_nominal: nominal),
      );
      Navigator.of(context).push(route);
    } else if (1000000 <= nominal && nominal <= 50000000) {
      var route = new MaterialPageRoute(
        builder: (BuildContext) =>
            new Sepuluhjuta(h_tujuan: tujuan, h_nominal: nominal),
      );
      Navigator.of(context).push(route);
    } else if (nominal > 50000000) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Limit();
        }),
      );
    } else if (nominal < 1000000) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Limitkecil();
        }),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

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
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF01579B),
            ),
          ),
          SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
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
                                " Yuk \n Nabung ",
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
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          "\nMasukan Nominal Tujuan : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextFormField(
                            maxLength: 15,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              CurrencyFormat()
                            ],
                            onChanged: (txt) {
                              setState(() {
                                tujuan = int.parse(
                                    txt.replaceAll(RegExp(r'(\,)'), ""));
                              });
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Rp.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: ' Masukan Nominal'),
                            keyboardType: TextInputType.number,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Kolom Tidak boleh kosong";
                              } else if (value.length < 9) {
                                return "Kolom minimal 8 Angka";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          "Pendapatan Perbulan : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextFormField(
                            maxLength: 15,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              CurrencyFormat()
                            ],
                            onChanged: (txt) {
                              setState(() {
                                nominal = int.parse(
                                    txt.replaceAll(RegExp(r'(\,)'), ""));
                              });
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Rp.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: ' Masukan Nominal'),
                            keyboardType: TextInputType.number,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Kolom Tidak boleh kosong";
                              } else if (value.length < 3) {
                                return "Kolom minimal 3 Angka";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    Container(
                      // alignment: Alignment.center,
                      width: size.width * 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 50),
                            color: Color(0xFF01579B),
                            onPressed: () {
                              if (_formKey.currentState.validate())
                                return hasil();
                            },
                            child: Text(
                              "PROSES",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
