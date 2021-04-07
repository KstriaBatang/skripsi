import 'package:flutter/material.dart';
import 'package:flutter_app2/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';



class cekinvestasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        children:<Widget>[
          Container(
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
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFF0288D1),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        height: 32.0,
                        width: 32.0,
                        child: SvgPicture.asset("assets/icon/menu.svg")),
                    ),
                  ),
                  Text(
                    "\n\nCek Tempat ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Investasimu \n ",
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
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                        ),
                          child: Column(
                          children: <Widget>[
                            Spacer(),
                            SvgPicture.asset("assets/icon/investasi.svg"),
                            Spacer(),
                            Text("Cek Nama\nInvestasimu",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 15),
                            ),
                            ],
                        ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(
                            children: <Widget>[
                              Spacer(),
                              Container(
                                  height: 64.0,
                                  width: 64.0,
                                  child: SvgPicture.asset("assets/icon/rekomendasi.svg")),
                              Spacer(),
                              Text("Rekomendasi\nInvestasi",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
