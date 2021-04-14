import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormSearchByCategory extends StatefulWidget {
  @override
  _FormSearchByCategoryState createState() => _FormSearchByCategoryState();
}

class _FormSearchByCategoryState extends State<FormSearchByCategory> {
  final GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();
  final TextEditingController minDepositController = MoneyMaskedTextController();
  final TextEditingController kisaranBungaController = TextEditingController();
  final TextEditingController golBukuController = TextEditingController();

  bool _isLoading = false;

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
            FormBuilderTextField(
              attribute: 'min deposit',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: minDepositController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixText: 'Rp. ',
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
            Text(
              'Kisaran Bunga :',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderTextField(
              attribute: 'kisaran bunga',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: kisaranBungaController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixText: '%',
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
            Text(
              'Golongan Buku :',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderTextField(
              attribute: 'gol buku',
              textInputAction: TextInputAction.send,
              keyboardType: TextInputType.number,
              controller: golBukuController,
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
                      vertical: 10.0,
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
                      } else {}
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
    print(minDepositController.text);
    if (minDepositController.text.isEmpty && kisaranBungaController.text.isEmpty && golBukuController.text.isEmpty) {
      return false;
    }
    return true;
  }
}
