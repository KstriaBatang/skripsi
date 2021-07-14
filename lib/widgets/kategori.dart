import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/data.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_app2/widgets/tampil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart';
import 'biodata.dart';

class kategori extends StatefulWidget {
  @override
  _kategoriState createState() => _kategoriState();
}

class _kategoriState extends State<kategori> {

  List<Data> display = [];
  List<Data> datas = [
    Data("Bank Mandiri", "https://bankmandiri.co.id/", "assets/icon/mandiri.png", "assets/icon/bankmandiri.png", "3,5%", "1.000.000", "Buku Empat"),
    Data("Bank Negara Indonesia", "https://www.bni.co.id/id-id/", "assets/icon/bni.png", "assets/icon/bankbni.png", "2,85%", "10.000.000", "Buku Empat"),
    Data("Bank Rakyat Indonesia", "https://www.bca.co.id/", "assets/icon/bri.png", "assets/icon/bankbri.png", "3,5%", "5.000.000", "Buku Empat"),
    Data("Bank Central Asia", "https://bankmandiri.co.id/", "assets/icon/bca.png", "assets/icon/bankbca.jpg", "2,8%", "8.000.000", "Buku Empat"),
    Data("Bank Cimb Niaga", "https://www.cimbniaga.co.id/id/personal/index", "assets/icon/cimb.png", "assets/icon/cimbbank.png", "3%", "5.000.000", "Buku Empat"),
    Data("Bank Danamon", "https://www.danamon.co.id/", "assets/icon/danamon.png", "assets/icon/bankdanamon.png", "3%", "8.000.000", "Buku Empat"),
    Data("Bank OCBC", "https://www.ocbcnisp.com/", "assets/icon/ocbc.png", "assets/icon/bankocbc.png", "2,75%", "8.000.000", "Buku Empat"),
    Data("Bank Panin", "https://www.danamon.co.id/", "assets/icon/panin.png", "assets/icon/paninbank.png", "2,25%", "10.000.000", "Buku Empat"),
    Data("Bank Permata", "https://www.permatabank.com/id/home/", "assets/icon/permata.png", "assets/icon/bankpermata.png", "2,75%", "10.000.000", "Buku Empat"),
    Data("Bank Tabungan Negara", "https://www.btn.co.id/", "assets/icon/btn.png", "assets/icon/bankbtn.png", "3,25%", "1.000.000", "Buku Tiga"),
    Data("Bank BJB", "https://www.bankbjb.co.id/ina", "assets/icon/bjb.png", "assets/icon/bankbjb.png", "3,5%", "2.500.000", "Buku Tiga"),
    Data("Bank DKI", "https://www.bankdki.co.id/id/", "assets/icon/dki.png", "assets/icon/bankdki.png", "3,75%", "1.000.000", "Buku Tiga"),
    Data("Bank Jateng", "https://www.bankjateng.co.id/en/", "assets/icon/jateng.png", "assets/icon/bankjateng.png", "3%", "1.000.000", "Buku Tiga"),
    Data("Bank Jatim", "https://www.bankjatim.co.id/en", "assets/icon/jatim.png", "assets/icon/bankjatim.png", "4,25%", "2.500.000", "Buku Tiga"),
    Data("Bank BTPN", "https://www.btpn.com/", "assets/icon/btpn.png", "assets/icon/bankbtpn.png", "4,5%", "10.000.000", "Buku Tiga"),
    Data("Bank DBS", "https://www.dbs.com/", "assets/icon/dbs.png", "assets/icon/bankdbs.png", "3,5%", "1.000.000", "Buku Tiga"),
    Data("Bank HSBC", "https://www.hsbc.co.id/1/2/", "assets/icon/hsbc.png", "assets/icon/bankhsbc.png", "3%", "20.000.000", "Buku Tiga"),
    Data("Bank IBK", "https://www.ibk.co.id/iview/03/CMIBMAN0000", "assets/icon/ibk.png", "assets/icon/bankibk.png", "3,6%", "1.000.000", "Buku Tiga"),
    Data("Bank ICBC", "https://www.icbc.co.id", "assets/icon/icbc.png", "assets/icon/bankicbc.png", "6,4%", "8.000.000", "Buku Tiga"),
    Data("Bank Bukopin", "https://www.bukopin.co.id/", "assets/icon/bukopin.png", "assets/icon/bankbukopin.png", "4,5%", "8.000.000", "Buku Tiga"),
    Data("Bank Mayapada", "https://www.bankmayapada.com/", "assets/icon/mayapada.png", "assets/icon/bankmayapada.png", "4,25%", "8.000.000", "Buku Tiga"),
    Data("Bank Maybank", "https://www.maybank.co.id/", "assets/icon/maybank.png", "assets/icon/bankmaybank.png", "3,5%", "10.000.000", "Buku Tiga"),
    Data("Bank Mega", "https://bankmega.com/id/", "assets/icon/mega.png", "assets/icon/bankmega.png", "2,25%", "8.000.000", "Buku Tiga"),
    Data("Bank Mizuho", "https://www.mizuhobank.co.id/", "assets/icon/mizuho.png", "assets/icon/bankmizuho.png", "5,62%", "10.000.000", "Buku Tiga"),
    Data("Bank UOB", "https://www.uob.co.id/", "assets/icon/uob.png", "assets/icon/bankuob.png", "4,25%", "8.000.000", "Buku Tiga"),
    Data("Bank Woori Saudara", "https://www.bankwoorisaudara.com/", "assets/icon/woori.png", "assets/icon/bankwoori.png", "3,75%", "5.000.000", "Buku Tiga"),
    Data("Bank Oke Indonesia", "https://www.okbank.co.id/", "assets/icon/oke.png", "assets/icon/bankoke.png", "4%", "10.000.000", "Buku Tiga"),
    Data("Bank BPD Bali", "https://www.bpdbali.co.id/", "assets/icon/bali.png", "assets/icon/bankbali.png", "3,75%", "500.000", "Buku Dua"),
    Data("Bank BPD DIY", "https://www.bpddiy.co.id/", "assets/icon/diy.png", "assets/icon/bankdiy.png", "3,75%", "500.000", "Buku Dua"),
    Data("Bank Banten", "https://www.bankbanten.co.id/", "assets/icon/banten.png", "assets/icon/bankbanten.png", "4,75%", "1.000.000", "Buku Dua"),
    Data("Bank Bengkulu", "https://www.bankbengkulu.co.id/", "assets/icon/bengkulu.png", "assets/icon/bankbengkulu.png", "4%", "1.000.000", "Buku Dua"),
    Data("Bank Jambi", "http://bankjambi.co.id/", "assets/icon/bankjambi.png", "assets/icon/jambi.png", "-", "-", "Buku Dua"),
    Data("Bank Kalbar", "http://www.bankkalbar.co.id/", "assets/icon/kalbar.png", "assets/icon/bankkalbar.png", "3,5%", "5.000.000", "Buku Dua"),
    Data("Bank Kalsel", "http://www.bankkalsel.co.id/", "assets/icon/kalsel.png", "assets/icon/bankkalsel.png", "3,25%", "3.000.000", "Buku Dua"),
    Data("Bank Kalteng", "http://www.bankkalteng.co.id/", "assets/icon/kalteng.png", "assets/icon/bankkalteng.png", "4,25%", "1.000.000", "Buku Dua"),
    Data("Bank Kaltimtara", "https://bankaltimtara.co.id/id", "assets/icon/kaltimtara.png", "assets/icon/bankkaltimtara.png", "3%", "1.000.000", "Buku Dua"),
    Data("Bank Lampung", "https://banklampung.co.id/", "assets/icon/lampung.png", "assets/icon/banklampung.png", "5,5%", "1.000.000", "Buku Dua"),
    Data("Bank Maluku Malut", "http://www.bankmalukumalut.co.id/public/guest/id", "assets/icon/malukumalut.png", "assets/icon/bankmalukumalut.png", "5,5%", "1.000.000", "Buku Dua"),
    Data("Bank Nagari", "https://banknagari.co.id/", "assets/icon/nagari.png", "assets/icon/banknagari.png", "-", "-", "Buku Dua"),
    Data("Bank NTT", "http://www.bpdntt.co.id/", "assets/icon/ntt.png", "assets/icon/bankntt.png", "5,25%", "1.000.000", "Buku Dua"),
    Data("Bank Papua", "https://www.bankpapua.co.id/", "assets/icon/papua.png", "assets/icon/bankpapua.png", "5%", "5.000.000", "Buku Dua"),
    Data("Bank Riau Kepri", "https://www.bankriaukepri.co.id/brkweb/", "assets/icon/riau.png", "assets/icon/bankriau.png", "-", "-", "Buku Dua"),
    Data("Bank Sulselbar", "https://ib.banksulselbar.co.id/", "assets/icon/sulselbar.png", "assets/icon/banksulselbar.png", "-", "-", "Buku Dua"),
    Data("Bank Sultra", "http://banksultra.co.id/v4/", "assets/icon/sultra.png", "assets/icon/banksultra.png", "5%", "1.000.000", "Buku Dua"),
    Data("Bank BSG", "https://www.banksulutgo.co.id/", "assets/icon/bsg.png", "assets/icon/bankbsg.png", "5%", "1.000.000", "Buku Dua"),
    Data("Bank Sumsel Babel", "https://www.banksumselbabel.com/", "assets/icon/sumselbabel.png", "assets/icon/banksumselbabel.png", "5%", "1.000.000", "Buku Dua"),
    Data("Bank Sumut", "https://www.banksumut.co.id/en/", "assets/icon/sumut.png", "assets/icon/banksumut.png", "-", "-", "Buku Dua"),
    Data("Bank Artha Graha Internasional", "http://www.arthagraha.com/", "assets/icon/arthagraha.png", "assets/icon/bankarthagraha.png", "-", "-", "Buku Dua"),
    Data("Bank Bumi Arta", "https://www.bankbba.co.id/", "assets/icon/bumiarta.png", "assets/icon/bankbumiarta.png", "4%", "8.000.000", "Buku Dua"),
    Data("Bank Capital Indonesia", "https://www.bankcapital.co.id/id", "assets/icon/capital.png", "assets/icon/bankcapital.png", "4,25%", "8.000.000", "Buku Dua"),
    Data("Bank CCB Indonesia", "https://idn.ccb.com/", "assets/icon/ccb.png", "assets/icon/bankccb.png", "3,25%", "8.000.000", "Buku Dua"),
    Data("Bank Commonwealth", "https://www.commbank.co.id/id", "assets/icon/common.png", "assets/icon/bankcommon.png", "3%", "50.000.000", "Buku Dua"),
    Data("Bank CTBC Indonesia", "https://www.ctbcbank.co.id/PersonalBanking/Id_PersonalBanking.html", "assets/icon/ctbc.png", "assets/icon/bankctbc.png", "3%", "8.000.000", "Buku Dua"),
    Data("Bank Ganesha", "https://www.bankganesha.co.id/", "assets/icon/ganeshalogo.png", "assets/icon/ganesha.png", "4,25%", "2.500.000", "Buku Dua"),
    Data("Bank Index Selindo", "https://www.bankindex.co.id/", "assets/icon/index.png", "assets/icon/bankindex.png", "-", "-", "Buku Dua"),
    Data("Bank J Trust Indonesia", "https://www.jtrustbank.co.id/index.php", "assets/icon/jtrust.png", "assets/icon/bankjtrust.png", "6%", "8.000.000", "Buku Dua"),
    Data("Bank KEB Hana", "https://www.hanabank.co.id/", "assets/icon/hana.png", "assets/icon/bankhana.png", "3%", "500.000", "Buku Dua"),
    Data("Bank Maspion", "http://www.bankmaspion.co.id/", "assets/icon/maspion.png", "assets/icon/bankmaspion.png", "5,75%", "5.000.000", "Buku Dua"),
    Data("Bank Mayora", "https://www.bankmayora.com/", "assets/icon/mayora.png", "assets/icon/bankmayora.png", "4%", "8.000.000", "Buku Dua"),
    Data("Bank Mestika Dharma", "https://www.bankmestika.co.id/id", "assets/icon/mestika.png", "assets/icon/bankmestika.png", "3,5%", "8.000.000", "Buku Dua"),
    Data("Bank MNC Internasional", "https://mncbank.co.id/id", "assets/icon/mnc.png", "assets/icon/bankmnc.png", "5%", "10.000.000", "Buku Dua"),
    Data("Bank Multiarta Sentosa", "https://bankmas.co.id/", "assets/icon/mas.png", "assets/icon/bankmas.png", "4,25%", "8.000.000", "Buku Dua"),
    Data("Bank National Nobu", "https://www.nobubank.com/", "assets/icon/nobu.png", "assets/icon/banknobu.png", "4%", "8.000.000", "Buku Dua"),
    Data("Bank SBI Indonesia", "https://www.sbiindo.com/", "assets/icon/sbi.png", "assets/icon/banksbi.png", "4%", "1.000.000", "Buku Dua"),
    Data("Bank Shinhan Indonesia", "https://www.shinhan.co.id/", "assets/icon/shinhan.png", "assets/icon/bankshinhan.png", "6.5%", "1.000.000", "Buku Dua"),
    Data("Bank Sinarmas ", "https://www.banksinarmas.com/id/personal", "assets/icon/sinarmas.png", "assets/icon/banksinarmas.png", "3%", "8.000.000", "Buku Dua"),
    Data("Bank Amar Indonesia ", "https://amarbank.co.id/", "assets/icon/amar.png", "assets/icon/bankamar.png", "6,25%", "1.000.000", "Buku Dua"),
    Data("Bank Ina Perdana ", "https://bankina.co.id/", "assets/icon/ina.png", "assets/icon/bankina.png", "4,25%", "1.000.000", "Buku Dua"),
    Data("Bank Jasa Jakarta ", "https://www.bjj.co.id/", "assets/icon/bjj.png", "assets/icon/bankbjj.png", "3,5%", "1.000.000", "Buku Dua"),
    Data("Bank Victoria Internasional ", "https://www.victoriabank.co.id/", "assets/icon/victoria.png", "assets/icon/bankvictoria.png", "-", "-", "Buku Satu"),
    Data("Bank Bisnis Internasional ", "http://bankbisnis.id/", "assets/icon/bsi.png", "assets/icon/bankbisnis.png", "4,75%", "1.000.000", "Buku Satu"),
    Data("Bank Fama Internasional ", "http://www.bankfama.co.id/home", "assets/icon/fama.png", "assets/icon/bankfama.png", "5%", "1.000.000", "Buku Satu"),
    Data("Bank Jago ", "https://www.jago.com/", "assets/icon/jago.png", "assets/icon/bankjago.png", "-", "-", "Buku Satu"),
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
