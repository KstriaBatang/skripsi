import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/data.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_app2/widgets/tampil.dart';
import 'package:flutter_svg/svg.dart';

class Rekomendasi11 extends StatefulWidget {
  @override
  _Rekomendasi11State createState() => _Rekomendasi11State();
}

class _Rekomendasi11State extends State<Rekomendasi11> {


  List<Data> display = [];
  List<Data> datas = [
    Data("Bank Banten", "https://www.bankbanten.co.id/", "assets/icon/banten.png", "assets/icon/bankbanten.png", "4,75%", "1.000.000", "Buku Dua"),
    Data("Bank Bengkulu", "https://www.bankbengkulu.co.id/", "assets/icon/bengkulu.png", "assets/icon/bankbengkulu.png", "4%", "1.000.000", "Buku Dua"),
    Data("Bank Kalteng", "http://www.bankkalteng.co.id/", "assets/icon/kalteng.png", "assets/icon/bankkalteng.png", "4,25%", "1.000.000", "Buku Dua"),
    Data("Bank SBI Indonesia", "https://www.sbiindo.com/", "assets/icon/sbi.png", "assets/icon/banksbi.png", "4%", "1.000.000", "Buku Dua"),
    Data("Bank Ina Perdana ", "https://bankina.co.id/", "assets/icon/ina.png", "assets/icon/bankina.png", "4,25%", "1.000.000", "Buku Dua"),
    Data("Bank Sultra", "http://banksultra.co.id/v4/", "assets/icon/sultra.png", "assets/icon/banksultra.png", "5%", "1.000.000", "Buku Dua"),
    Data("Bank BSG", "https://www.banksulutgo.co.id/", "assets/icon/bsg.png", "assets/icon/bankbsg.png", "5%", "1.000.000", "Buku Dua"),
    Data("Bank Sumsel Babel", "https://www.banksumselbabel.com/", "assets/icon/sumselbabel.png", "assets/icon/banksumselbabel.png", "5%", "1.000.000", "Buku Dua"),
  ];

  @override
  void initState() {
    setState(() {
      display = datas;
    });
    super.initState();
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
            height: size.height * .43,
            decoration: BoxDecoration(
              color: Color(0xFF01579B),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Cek Tempat \nInvestasimu",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 64,
                      width: 64,
                      child: SvgPicture.asset(
                        "assets/icon/investasi.svg",
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        child: TextField(
                          onChanged: (text) {
                            text = text.toLowerCase();
                            setState(() {
                              display = datas.where((datas) {
                                var datasTitle = datas.nama.toLowerCase();
                                return datasTitle.contains(text);
                              }).toList();
                            });
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                    height: 10,
                                    width: 10,
                                    child: Image.asset("assets/icon/cari.png")),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Cari Bank Disini'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 300),
            child: ListView.builder(
              itemCount: display.length,
              itemBuilder: (context, index) {
                return OutlineButton(
                  onPressed: () {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext) => new Tampil(
                        display[index].nama,
                        display[index].link,
                        display[index].logo,
                        display[index].gambar,
                        display[index].bunga,
                        display[index].nominal,
                        display[index].buku,
                      ),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(display[index].nama,style: TextStyle(fontSize: 20),),

                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              height: 64,
                              width: 64,
                              child: Image.asset(display[index].logo)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

