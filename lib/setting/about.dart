import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_svg/svg.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Yuk Nabung",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Yuk Nabung merupakan sebuah menu yang disediakan agar user dapat menghitung keuntungan yang didapatkan dengan menetapkan nominal yang ingin dituju beserta pendapatan bersih tiap bulannya. Rekomendasi bank yang di keluarkan akan berisi sesuai dengan kemampuan yang dilandasi dari penghasilan bersih setiap bulan. Fitur ini akan menampilkan rincian perhitungan bunga secara lengkap beserta jangka waktu yang akan di capai.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Hitung Bunga",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Hitung bunga menyediakan fitur agar user dapat menghitung bunga dengan memasukan nominal , bunga yang ditetapkan, dan juga total hari yang ditentukan. Perhitungan bunga berdasarkan perhitungan bunga yang ditentukan oleh Bank Indonesia dimana perhitungan akan dikenakan pajak sebesar 20 % sehingga perhitungan seperti berikut : \n(nominal)*(bunga)*(80%)/365 * total hari.",  style: TextStyle(fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Cek Tempat Investasimu",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Cek Tempat Investasimu memiliki fitur agar user dapat mencari tempat investasi (Perbankan) berdasarkan nama dan juga kategori yang terbagi menjadi (minimal deposito, bunga, dan jenis buku dari pada suatu bank).",style: TextStyle(fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Belajar Nabung Yuk",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Belajar Nabung Yuk merupakan sebuah menu yang berisi sebuah video untuk mengajak kita untuk memulai menabung beserta sedikit penjelasan mengenai menabung di bank.",style: TextStyle(fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
