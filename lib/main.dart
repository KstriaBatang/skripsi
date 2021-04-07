import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/constants.dart';
import 'package:flutter_app2/scenes/cekinvestasi.dart';
import 'package:flutter_app2/widgets/category_dart.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical :10),
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              Column(
                children: <Widget>[
                SvgPicture.asset("assets/icon/home.svg"),
                Text("Home"),
                ],
              ),
            Column(
              children: <Widget>[
                Container(
                    height: 32.0,
                    width: 32.0,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/icon/profile.svg")), Text("Profile"),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 32.0,
                    width: 32.0,
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/icon/settings.svg")), Text("Settings"),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height:52,
                      width:52,
                      decoration: BoxDecoration(
                        color: Color(0xFF0288D1),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                          height:32.0,
                          width:32.0,
                          child: SvgPicture.asset("assets/icon/menu.svg")),
                      
                    ),
                  ),
                  Text (
                    " \n DASHBOARD \n 4 Items \n ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children:<Widget>[
                          CategoryCard(
                            title: "Yuk Nabung",
                            svgSrc:"assets/icon/plan.svg",
                            height: 32.0,
                            width: 32.0,
                            press: () {},
                          ),
                          CategoryCard(
                            title: "Hitung Bunga",
                            svgSrc:"assets/icon/investasi.svg",
                            height: 52.0,
                            width: 52.0,
                            press: () {},
                          ),
                          CategoryCard(
                            title: "Cek Tempat Investasimu",
                            height: 32.0,
                            width: 32.0,
                            svgSrc:"assets/icon/search.svg",
                            press: () {Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return cekinvestasi();
                                }),
                            );
                            },
                          ),
                          CategoryCard(
                            title: "Belajar Nabung \n Yuk",
                            svgSrc:"assets/icon/education.svg",
                            height: 32.0,
                            width: 32.0,
                            press: () {},
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



