import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app2/modules/dashboard/components/BottomNavigation.dart';
import 'package:flutter_app2/modules/nominal-tujuan/components/ListMonthly.dart';
import 'package:flutter_app2/providers/consultation.dart';
import 'package:flutter_app2/providers/auth.dart';

class NominalTujuanPage extends StatefulWidget {
  final int nomimalTujuan;
  final int monthlyRevenue;

  NominalTujuanPage({
    @required this.nomimalTujuan,
    @required this.monthlyRevenue,
  });

  @override
  _NominalTujuanPageState createState() => _NominalTujuanPageState();
}

class _NominalTujuanPageState extends State<NominalTujuanPage> {
  bool _isLoading = true;
  String _token;

  @override
  void initState() {
    super.initState();
    _token = Provider.of<AuthProvider>(context, listen: false).user.token;
    Provider.of<ConsultationProvider>(context, listen: false)
        .getList(
          token: _token,
          monthlyRevenue: widget.monthlyRevenue,
          tujuan: widget.nomimalTujuan,
        )
        .then((value) => setState(() => _isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _list = Provider.of<ConsultationProvider>(context).list;

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
            create: (_) => ConsultationProvider(),
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
                            "Nominal Tujuan \nRp. ${NumberFormat("#,##0.##").format(widget.nomimalTujuan)}",
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
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            height: size.height * .55,
                            margin: EdgeInsets.only(top: size.height * .15),
                            color: Colors.transparent,
                            child: ListView.builder(
                              itemCount: _list.length,
                              itemBuilder: (ctx, i) {
                                return ListMonthly(
                                  first: i == 0,
                                  last: i == _list.length,
                                  currentMonthNominal: _list[i].currentMonthNominal,
                                  month: _list[i].month,
                                  name: _list[i].name,
                                  pic: _list[i].pic,
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
