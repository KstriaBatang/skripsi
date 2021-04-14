import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/modules/search-by-name/components/ListBank.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormSearchByName extends StatefulWidget {
  @override
  _FormSearchByNameState createState() => _FormSearchByNameState();
}

class _FormSearchByNameState extends State<FormSearchByName> {
  final GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();
  final TextEditingController nameController = TextEditingController();

  bool _isLoading = false;

  List _list = [
    {"name": "Bank Central Asia", "pict": "assets/icon/bca.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
    {"name": "Bank Mandiri", "pict": "assets/icon/mandiri.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * .08),
      child: FormBuilder(
        key: globalFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masukkan Nama Bank :',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderTextField(
              attribute: 'nama bank',
              textInputAction: TextInputAction.search,
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black26,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: size.height * .5,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (ctx, i) {
                  return ListBank(
                    bankName: _list[i]['name'],
                    pict: _list[i]['pict'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doSearch() {}
}
