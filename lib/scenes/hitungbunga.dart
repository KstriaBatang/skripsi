import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/bungahitung.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/main.dart';

import '../currency.dart';

class hitungbunga extends StatefulWidget {
  @override
  _hitungbungaState createState() => _hitungbungaState();
}

class _hitungbungaState extends State<hitungbunga> {
  int nominal = 0;
  double bunga = 0;
  int hari = 0;

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
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
                              " Hitung \n Bungamu ",
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
                                child: SvgPicture.asset(
                                    "assets/icon/investasi.svg")),
                          ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        "Masukan Nominal : ",
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
                            } else if (value.length < 6) {
                              return "Kolom minimal 6 Angka";
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
                        "Masukan Bunga (%) : ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                          maxLength: 4,
                          onChanged: (txt) {
                            setState(() {
                              bunga = double.parse(txt);
                            });
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              hintText: ('Masukan Bunga')),
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Kolom Tidak boleh kosong";
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
                        "Masukan Jumlah Hari  : ",
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
                          horizontal: 10, vertical: 10),
                      child: TextField(
                        maxLength: 10,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          CurrencyFormat()
                        ],
                        onChanged: (txt) {
                          setState(() {
                            hari =
                                int.parse(txt.replaceAll(RegExp(r'(\,)'), ""));
                          });
                        },
                        // controller: thari,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "Hari",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            hintText: 'Jumlah Hari'),
                        keyboardType: TextInputType.number,
                      ),
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
                            var route = new MaterialPageRoute(
                              builder: (BuildContext) => new bungahitung(
                                  h_nominal: nominal,
                                  h_bunga: bunga,
                                  h_hari: hari),
                            );
                            Navigator.of(context).push(route);
                          },
                          child: Text(
                            "HITUNG",
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
        ],
      ),
    );
  }
}

