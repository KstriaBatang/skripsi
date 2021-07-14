import 'package:flutter/material.dart';
import 'package:flutter_app2/scenes/rekomendasi12.dart';
import 'package:flutter_app2/scenes/rekomendasi13.dart';
import 'package:flutter_app2/scenes/rekomendasi14.dart';
import 'package:flutter_app2/scenes/rekomendasi15.dart';
import 'package:flutter_app2/scenes/rekomendasi16.dart';
import 'package:flutter_app2/scenes/rekomendasi17.dart';
import 'package:flutter_app2/scenes/rekomendasi18.dart';
import 'package:flutter_app2/scenes/rekomendasi19.dart';
import 'package:flutter_app2/scenes/rekomendasi20.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/scenes/rekomendasi1.dart';
import 'package:flutter_app2/scenes/rekomendasi2.dart';
import 'package:flutter_app2/scenes/rekomendasi3.dart';
import 'package:flutter_app2/scenes/rekomendasi4.dart';
import 'package:flutter_app2/scenes/rekomendasi5.dart';
import 'package:flutter_app2/scenes/rekomendasi6.dart';
import 'package:flutter_app2/scenes/rekomendasi7.dart';
import 'package:flutter_app2/scenes/rekomendasi8.dart';
import 'package:flutter_app2/scenes/rekomendasi9.dart';
import 'package:flutter_app2/scenes/rekomendasi10.dart';
import 'package:flutter_app2/scenes/rekomendasi11.dart';

import 'hitungbunga.dart';

class rekomendasi extends StatefulWidget {
  @override
  _rekomendasiState createState() => _rekomendasiState();
}

class _rekomendasiState extends State<rekomendasi> {
  Future hasil() async {
    if (selectednominal.nom == "Dibawah Rp 3.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 4") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi1()));
     }
    else if (selectednominal.nom == "Rp 3.000.000,- s/d Rp 5.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 4") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi2()));
    }
    else if (selectednominal.nom == "Diatas Rp 5.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 4") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi3()));
    }
    else if (selectednominal.nom == "Dibawah Rp 3.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 3") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi4()));
    }
    else if (selectednominal.nom == "Dibawah Rp 3.000.000,-" &&
        selectedbunga.bung == "4% s/d 5%" &&
        selectedbuku.buk == "Buku 3") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi5()));
    }
    else if (selectednominal.nom == "Rp 3.000.000,- s/d Rp 5.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 3") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi6()));
    }
    else if (selectednominal.nom == "Diatas Rp 5.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 3") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi7()));
    }
    else if (selectednominal.nom == "Diatas Rp 5.000.000,-" &&
        selectedbunga.bung == "4% s/d 5%" &&
        selectedbuku.buk == "Buku 3") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi8()));
    }
    else if (selectednominal.nom == "Diatas Rp 5.000.000,-" &&
        selectedbunga.bung == "Diatas 5%" &&
        selectedbuku.buk == "Buku 3") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi9()));
    }
    else if (selectednominal.nom == "Dibawah Rp 3.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi10()));
    }
    else if (selectednominal.nom == "Dibawah Rp 3.000.000,-" &&
        selectedbunga.bung == "4% s/d 5%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi11()));
    }
    else if (selectednominal.nom == "Dibawah Rp 3.000.000,-" &&
        selectedbunga.bung == "Diatas 5%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi12()));
    }
    else if (selectednominal.nom == "Rp 3.000.000,- s/d Rp 5.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi13()));
    }
    else if (selectednominal.nom == "Rp 3.000.000,- s/d Rp 5.000.000,-" &&
        selectedbunga.bung == "4% s/d 5%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi14()));
    }
    else if (selectednominal.nom == "Rp 3.000.000,- s/d Rp 5.000.000,-" &&
        selectedbunga.bung == "Diatas 5%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi15()));
    }
    else if (selectednominal.nom == "Diatas Rp 5.000.000,-" &&
        selectedbunga.bung == "Dibawah 4%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi16()));
    }
    else if (selectednominal.nom == "Diatas Rp 5.000.000,-" &&
        selectedbunga.bung == "4% s/d 5%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi17()));
    }
    else if (selectednominal.nom == "Diatas Rp 5.000.000,-" &&
        selectedbunga.bung == "Diatas 5%" &&
        selectedbuku.buk == "Buku 2") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi18()));
    }
    else if (selectednominal.nom == "Dibawah Rp 3.000.000,-" &&
        selectedbunga.bung == "4% s/d 5%" &&
        selectedbuku.buk == "Buku 1") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi19()));
    }
    else{
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Rekomendasi20()));
    }
  }


  nominal selectednominal;
  List<nominal> nominals = [
    nominal("Dibawah Rp 3.000.000,-"),
    nominal("Rp 3.000.000,- s/d Rp 5.000.000,-"),
    nominal("Diatas Rp 5.000.000,-")
  ];

  bunga selectedbunga;
  List<bunga> bungas = [
    bunga("Dibawah 4%"),
    bunga("4% s/d 5%"),
    bunga("Diatas 5%")
  ];

  buku selectedbuku;
  List<buku> bukus = [
    buku("Buku 4"),
    buku("Buku 3"),
    buku("Buku 2"),
    buku("Buku 1")
  ];

  List<DropdownMenuItem> generateNominal(List<nominal> nominals) {
    List<DropdownMenuItem> nomitems = [];
    for (var nomitem in nominals) {
      nomitems.add(DropdownMenuItem(
        child: Text(nomitem.nom),
        value: nomitem,
      ));
    }
    return nomitems;
  }

  List<DropdownMenuItem> generateBunga(List<bunga> bungas) {
    List<DropdownMenuItem> bungitems = [];
    for (var bungitem in bungas) {
      bungitems.add(DropdownMenuItem(
        child: Text(bungitem.bung),
        value: bungitem,
      ));
    }
    return bungitems;
  }

  List<DropdownMenuItem> generateBuku(List<buku> bukus) {
    List<DropdownMenuItem> bukitems = [];
    for (var bukitem in bukus) {
      bukitems.add(DropdownMenuItem(
        child: Text(bukitem.buk),
        value: bukitem,
      ));
    }
    return bukitems;
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                              " \n Rekomendasi\n Investasi \n",
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
                                child: SvgPicture.asset(
                                    "assets/icon/rekomendasi.svg")),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Nominal: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Nominal',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    // isExpanded: true,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    value: selectednominal,
                                    items: generateNominal(nominals),
                                    onChanged: (nomitem) {
                                      print(nomitem);
                                      setState(() {
                                        selectednominal = nomitem;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Bunga :",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'bunga',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    // isExpanded: true,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    value: selectedbunga,
                                    items: generateBunga(bungas),
                                    onChanged: (bungitem) {
                                      print(bungitem);
                                      setState(() {
                                        selectedbunga = bungitem;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Buku : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Buku',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    // isExpanded: true,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    value: selectedbuku,
                                    items: generateBuku(bukus),
                                    onChanged: (bukitem) {
                                      print(bukitem);
                                      setState(() {
                                        selectedbuku = bukitem;
                                      });
                                    },
                                  ),
                                ],
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
                                      hasil();
                                    },
                                    child: Text(
                                      "MULAI PENCARIAN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class nominal {
  String nom;

  nominal(this.nom);
}

class bunga {
  String bung;

  bunga(this.bung);
}

class buku {
  String buk;

  buku(this.buk);
}
