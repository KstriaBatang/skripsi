import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/data.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_app2/widgets/tampil.dart';
import 'package:flutter_svg/svg.dart';

class Rekomendasi4 extends StatefulWidget {
  @override
  _Rekomendasi4State createState() => _Rekomendasi4State();
}

class _Rekomendasi4State extends State<Rekomendasi4> {


  List<Data> display = [];
  List<Data> datas = [
    Data("Bank Tabungan Negara", "https://www.btn.co.id/", "assets/icon/btn.png", "assets/icon/bankbtn.png", "3,25%", "1.000.000", "Buku Tiga"),
    Data("Bank BJB", "https://www.bankbjb.co.id/ina", "assets/icon/bjb.png", "assets/icon/bankbjb.png", "3,5%", "2.500.000", "Buku Tiga"),
    Data("Bank DKI", "https://www.bankdki.co.id/id/", "assets/icon/dki.png", "assets/icon/bankdki.png", "3,75%", "1.000.000", "Buku Tiga"),
    Data("Bank Jateng", "https://www.bankjateng.co.id/en/", "assets/icon/jateng.png", "assets/icon/bankjateng.png", "3%", "1.000.000", "Buku Tiga"),
    Data("Bank DBS", "https://www.dbs.com/", "assets/icon/dbs.png", "assets/icon/bankdbs.png", "3,5%", "1.000.000", "Buku Tiga"),
    Data("Bank IBK", "https://www.ibk.co.id/iview/03/CMIBMAN0000", "assets/icon/ibk.png", "assets/icon/bankibk.png", "3,6%", "1.000.000", "Buku Tiga"),
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

