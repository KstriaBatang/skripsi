import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class FormYukNabung extends StatefulWidget {
  @override
  _ForHYukNabungState createState() => _ForHYukNabungState();
}

class _ForHYukNabungState extends State<FormYukNabung> {
  final GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController pendapatanBersihController = TextEditingController();

  String _formatNumber(String s) => NumberFormat.decimalPattern('ID').format(int.parse(s));

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
              'Masukkan Nominal Tujuan :',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderTextField(
              attribute: 'nominal',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: nominalController,
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
              onChanged: (string) {
                string = '${_formatNumber(string.replaceAll(',', ''))}';
                nominalController.value = TextEditingValue(
                  text: string,
                  selection: TextSelection.collapsed(offset: string.length),
                );
              },
              validators: [
                FormBuilderValidators.required(errorText: 'harus terisi'),
                FormBuilderValidators.min(1, errorText: 'harus lebih besar dari 1'),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Bunga :',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderTextField(
              attribute: 'bunga',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: pendapatanBersihController,
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
              onChanged: (string) {
                string = '${_formatNumber(string.replaceAll(',', ''))}';
                pendapatanBersihController.value = TextEditingValue(
                  text: string,
                  selection: TextSelection.collapsed(offset: string.length),
                );
              },
              validators: [
                FormBuilderValidators.required(errorText: 'harus terisi'),
                FormBuilderValidators.min(1, errorText: 'harus lebih besar dari 1'),
              ],
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
                              "Hitung",
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
                      if (validateAndSave()) {
                        setState(() {
                          _isLoading = true;
                        });
                        Fluttertoast.showToast(msg: 'Berhasil masuk.');
                      }
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
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}