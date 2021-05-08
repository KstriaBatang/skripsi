import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/modules/nominal-tujuan/NomimalTujuan.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_app2/utils/ThousandSeparator.dart';

class FormYukNabung extends StatefulWidget {
  @override
  _ForHYukNabungState createState() => _ForHYukNabungState();
}

class _ForHYukNabungState extends State<FormYukNabung> {
  final GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController pendapatanBersihController = TextEditingController();

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
              name: 'nominal',
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
              inputFormatters: [ThousandSeparator()],
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context, errorText: 'harus terisi'),
                FormBuilderValidators.min(context, 1, errorText: 'harus lebih besar dari 1'),
              ]),
            ),
            SizedBox(height: 15),
            Text(
              'Pendapatan Per Bulan :',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 5),
            FormBuilderTextField(
              name: 'monthly revenue',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: pendapatanBersihController,
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
              inputFormatters: [ThousandSeparator()],
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context, errorText: 'harus terisi'),
                FormBuilderValidators.min(context, 1, errorText: 'harus lebih besar dari 1'),
              ]),
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
                      setState(() {
                        _isLoading = true;
                      });
                      if (validateAndSave()) {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => NominalTujuanPage(
                              monthlyRevenue: int.parse(pendapatanBersihController.text.replaceAll(new RegExp(r'(\,)'), '')),
                              nomimalTujuan: int.parse(nominalController.text.replaceAll(new RegExp(r'(\,)'), '')),
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          _isLoading = false;
                        });
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
