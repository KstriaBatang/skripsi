import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

import 'login.dart';


class daftar extends StatefulWidget {
  @override
  _daftarState createState() => _daftarState();
}

class _daftarState extends State<daftar> {
  TextEditingController namadepan = TextEditingController();
  TextEditingController namabelakang = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  DateTime date = DateTime.now();

  String getText() {
    if (date == null) {
      return 'Select Date';
    }
    else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  String jenkelGroupValue = '';
  status selectedstatus;
  List<status> statuss = [
    status("Mahasiswa/Pelajar"),
    status("Karyawan Swasta"),
    status("Wiraswasta"),
  ];

  final _formKey = GlobalKey <FormState>();

  Future register() async {
    var url = "http://192.168.0.105/Flutter/register.php";
    var response = await http.post(Uri.parse(url), body: {
      "nama_depan": namadepan.text,
      "nama_belakang": namabelakang.text,
      "tgl_lahir": "$date",
      "jenis_kelamin": "$jenkelGroupValue",
      "stat_pekerjaan": selectedstatus.stat,
      "email": email.text,
      "password": password.text,
    });

    var data = json.decode((response.body));
    // debugPrint('response: ${data}');
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: "Username Already Registered",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
          msg: "Registrasi Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return login();
        }),
      );
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
    );

    if (_datePicker != null && _datePicker != date) {
      setState(() {
        date = _datePicker;
        print(
          date.toString(),
        );
      });
    }
  }

  List<DropdownMenuItem> generateItems(List<status> statuss) {
    List<DropdownMenuItem> items = [];
    for (var item in statuss) {
      items.add(DropdownMenuItem(
        child: Text(item.stat),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF01579B),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        " Form \n Registrasi",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    Container(
                        height: 128,
                        width: 128,
                        child: Image.asset(
                          "assets/icon/register.png",
                        ))
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 320),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Text(
                                  "Nama Depan : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                  controller: namadepan,
                                  maxLength: 15,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                                    BlacklistingTextInputFormatter(RegExp("[/\\0-9]")),

                                  ],
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      hintText: ' Nama Depan'),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Nama Tidak Boleh Kosong";
                                    }
                                    else if (value.length < 3) {
                                      return "Kolom nama minimal 3 huruf";
                                    }
                                    else {
                                      return null;
                                    }
                                  }
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Text(
                                  "Nama Belakang : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                  controller: namabelakang,
                                  maxLength: 15,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                                    BlacklistingTextInputFormatter(RegExp("[/\\0-9]")),

                                  ],
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      hintText: ' Nama Belakang'),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Nama Tidak Boleh Kosong";
                                    }
                                    else if (value.length < 3) {
                                      return "Kolom nama minimal 3 huruf";
                                    }
                                    else {
                                      return null;
                                    }
                                  }
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Text(
                                  "Tanggal Lahir : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    readOnly: true,
                                    onTap: () {
                                      setState(() {
                                        _selectDate(context);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: getText(),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(1),
                                        child: Column(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                                "assets/icon/calendar.svg"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Text(
                                  "Jenis Kelamin : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Radio(
                                            value: 'Pria',
                                            groupValue: jenkelGroupValue,
                                            onChanged: (val) {
                                              print(val);
                                              setState(() {
                                                jenkelGroupValue = val;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Pria",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Radio(
                                            value: 'Wanita',
                                            groupValue: jenkelGroupValue,
                                            onChanged: (val) {
                                              print(val);
                                              setState(() {
                                                jenkelGroupValue = val;
                                              });
                                            }),
                                      ),
                                      Container(
                                        child: Text(
                                          "Wanita",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Text(
                                  "Status Pekerjaan : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Status Pekerjaan',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                    // isExpanded: true,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    value: selectedstatus,
                                    items: generateItems(statuss),
                                    onChanged: (item) {
                                      print(item);
                                      setState(() {
                                        selectedstatus = item;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Text(
                                  "Email : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: email,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                validator: (value) =>
                                EmailValidator.validate(value) && value.length < 7
                                    ? null
                                    : "Masukan dengan format email yang benar",

                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    hintText: 'Alamat Email'),
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Text(
                                  "Password : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                  controller: password,
                                  obscureText: true,
                                  maxLength: 15,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      hintText: ' Password'),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Password Tidak Boleh Kosong";
                                    }
                                    else if (value.length < 6) {
                                      return "Minimal Password 6 digit";
                                    }
                                    else {
                                      return null;
                                    }
                                  }
                              ),
                            ),
                            Container(
                              // alignment: Alignment.center,
                              width: size.width * 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 25),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FlatButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 50),
                                    color: Color(0xFF01579B),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        register();
                                      }
                                      else{
                                      print ("Gagal");
                                      }
                                    },
                                    child: Text(
                                      "Daftar Sekarang",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class status {
  String stat;


  status(this.stat);
}
