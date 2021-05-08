import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_app2/utils/ThousandSeparator.dart';
import 'package:flutter_app2/modules/search-by-category/List.dart';

class FormSearchByCategory extends StatefulWidget {
  @override
  _FormSearchByCategoryState createState() => _FormSearchByCategoryState();
}

class _FormSearchByCategoryState extends State<FormSearchByCategory> {
  final GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();

  bool _isLoading = false;
  String _nominal;
  int _golBuku = -1;
  String _kisaranBunga;

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
              'Minimal Deposito :',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderRadioGroup(
              name: 'jenis kelamin',
              options: [
                FormBuilderFieldOption(
                  child: Text('>= 10jt'),
                  value: '> 10',
                ),
                FormBuilderFieldOption(
                  child: Text('< 10jt'),
                  value: '< 10',
                )
              ],
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
              validator: FormBuilderValidators.compose([FormBuilderValidators.required(context, errorText: 'harus terisi')]),
              onChanged: (value) => setState(
                () => _nominal = value,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Kisaran Bunga :',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderDropdown(
                name: 'kisaran bunga',
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
                onChanged: (value) => setState(
                      () => _kisaranBunga = value,
                    ),
                initialValue: '',
                items: [
                  DropdownMenuItem(
                    child: Text('Pilih Satu'),
                    value: '',
                  ),
                  DropdownMenuItem(
                    child: Text('> 3%'),
                    value: '>3',
                  ),
                  DropdownMenuItem(
                    child: Text('3 - 5%'),
                    value: '3-5',
                  ),
                  DropdownMenuItem(
                    child: Text('<5%'),
                    value: '<5',
                  ),
                ]),
            SizedBox(height: 15),
            Text(
              'Golongan Buku :',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderDropdown(
                name: 'gol buku',
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
                onChanged: (value) => setState(
                      () => _golBuku = value,
                    ),
                initialValue: -1,
                items: [-1, 1, 2, 3, 4]
                    .map((val) => val > 0
                        ? DropdownMenuItem(
                            child: Text('Buku $val'),
                            value: val,
                          )
                        : DropdownMenuItem(
                            child: Text('Pilih Satu'),
                            value: -1,
                          ))
                    .toList()),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF2F34AD),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  highlightColor: Colors.black12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 7.0,
                      horizontal: 15.0,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: _isLoading
                          ? Text(
                              "Mohon tunggu...",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "Cari",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                  onTap: () async {
                    if (!_isLoading) {
                      setState(() {
                        _isLoading = true;
                      });
                      if (!validateAndSave()) {
                        Fluttertoast.showToast(
                          msg: 'Setidaknya isi salah satu kolom',
                          backgroundColor: Colors.red,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ListSearch(
                              bunga: _kisaranBunga,
                              golBuku: _golBuku.toString(),
                              minDeposit: _nominal,
                            ),
                          ),
                        );
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    if (_nominal == null && _kisaranBunga == null && _golBuku == -1) {
      return false;
    }
    return true;
  }
}
