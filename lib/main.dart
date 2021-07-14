import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/BelajarNabung/Bnabung.dart';
import 'package:flutter_app2/constants.dart';
import 'package:flutter_app2/scenes/cekinvestasi.dart';
import 'package:flutter_app2/scenes/hitungbunga.dart';
import 'package:flutter_app2/scenes/login.dart';
import 'package:flutter_app2/scenes/yuknabung.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/category_dart.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(displayColor: kTextColor),
      ),
      home: login(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final storage = new FlutterSecureStorage();
  String email = "";
  String nama_depan = "";
  String nama_belakang = "";
  String tgl_lahir = "";
  String jenis_kelamin = "";
  String stat_pekerjaan = "";

  @override
  void initState() {
    masuk();
    super.initState();
  }


  Future<String> masuk() async {

    email = await storage.read(key: "email");
    nama_depan = await storage.read(key: "nama_depan");
    nama_belakang = await storage.read(key:"nama_belakang");
    tgl_lahir = await storage.read(key:"tgl_lahir");
    jenis_kelamin = await storage.read(key:"jenis_kelamin");
    stat_pekerjaan = await storage.read(key:"stat+pekerjaan");
    Map<String, String> allValues = await storage.readAll();
    print("allValues : $allValues");
    print(email);
    print(nama_depan);
    print(nama_belakang);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
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
                    children: <Widget>[
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
        children: <Widget>[Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Align(
                            // alignment : Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "\n \n DASHBOARD \n 4 Items \n",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
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
                        CategoryCard(
                          title: "Yuk Nabung",
                          svgSrc: "assets/icon/plan.svg",
                          height: 64.0,
                          width: 64.0,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return yuknabung();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Hitung Bunga",
                          svgSrc: "assets/icon/investasi.svg",
                          height: 64.0,
                          width: 64.0,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return hitungbunga();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Cek Tempat Investasimu",
                          height: 64.0,
                          width: 64.0,
                          svgSrc: "assets/icon/search.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return cekinvestasi();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Belajar Nabung \n Yuk",
                          svgSrc: "assets/icon/education.svg",
                          height: 64.0,
                          width: 64.0,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Bnabung();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}









