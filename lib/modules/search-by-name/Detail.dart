import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app2/models/bank.dart';
import 'package:flutter_app2/modules/dashboard/components/BottomNavigation.dart';
import 'package:flutter_app2/modules/search-by-name/components/DetailForm.dart';

class DetailBankPage extends StatelessWidget {
  final Bank bank;

  DetailBankPage(this.bank);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          SafeArea(
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
                        Flexible(
                          child: Text(
                            "${bank.nama}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(bank.pic),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DetailFormBank(
                    bunga: bank.bunga,
                    jenisBuku: bank.jenisBuku,
                    minDeposit: bank.minDeposit,
                    tanggalBerdiri: bank.tanggalBerdiri,
                    web: bank.web,
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
