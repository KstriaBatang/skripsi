import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app2/providers/bank.dart';
import 'package:flutter_app2/providers/auth.dart';
import 'package:flutter_app2/modules/dashboard/components/BottomNavigation.dart';
import 'package:flutter_app2/modules/search-by-name/components/ListBank.dart';
import 'package:flutter_app2/modules/search-by-name/Detail.dart';

class ListSearch extends StatefulWidget {
  final String minDeposit;
  final String bunga;
  final String golBuku;

  ListSearch({
    this.minDeposit,
    this.bunga,
    this.golBuku,
  });

  @override
  _ListSearchState createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  bool _isLoading = true;
  String _token;

  @override
  void initState() {
    super.initState();
    _token = Provider.of<AuthProvider>(context, listen: false).user.token;
    Provider.of<BankProvider>(context, listen: false)
        .getList(
          token: _token,
          bunga: widget.bunga.isNotEmpty ? (double.parse(widget.bunga) / 100).toStringAsFixed(2) : '',
          golBuku: widget.golBuku.toString(),
          minDeposit: widget.minDeposit.toString(),
        )
        .then((value) => setState(() => _isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bankData = Provider.of<BankProvider>(context);
    final _list = bankData.list;

    return Scaffold(
      bottomNavigationBar: BottomNavigationNavbar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0088f5),
                  Color(0xFF0277d4),
                  Color(0xFF01579B),
                ],
                begin: FractionalOffset.bottomRight,
                end: FractionalOffset.topLeft,
              ),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => BankProvider(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hasil Filter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/icon/investasi.png'),
                          ),
                        ],
                      ),
                    ),
                    _isLoading
                        ? Container(
                            height: MediaQuery.of(context).size.height * .5,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Sedang mengambil data...')
                                ],
                              ),
                            ),
                          )
                        : Container(
                            height: size.height * .55,
                            margin: EdgeInsets.only(top: size.height * .15),
                            color: Colors.transparent,
                            child: ListView.builder(
                              itemCount: _list.length,
                              itemBuilder: (ctx, i) {
                                return ListBank(
                                  bankName: _list[i].nama,
                                  pict: _list[i].pic,
                                  press: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailBankPage(_list[i])));
                                  },
                                );
                              },
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
