import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/scenes/login.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:flutter_app2/widgets/settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final storage = new FlutterSecureStorage();
  String email = "";

  @override
  void initState() {
    setState(() {
      masuk();
    });
    super.initState();
  }



  Future<String> masuk() async {
    email = await storage.read(key: "email");
    Map<String, String> allValues = await storage.readAll();
    setState(() {

    });
  }

  TextEditingController password = TextEditingController();
  TextEditingController passwordbaru = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future edit() async {
    var url = "http://192.168.0.105/Flutter/edit.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email,
      "password": password.text,
      "passwordbaru": passwordbaru.text,
    });

    var data = json.decode((response.body));
    print(data['message']);
    if (data['message'] != "Success") {
      Fluttertoast.showToast(
          msg: "Error!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    } else {
      Fluttertoast.showToast(
          msg: "Password Berhasil Di Ganti",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => login()));
  }
  }

  @override
  Widget build(BuildContext context) {
    print("Email from secureStorage : $email");
    var size = MediaQuery
        .of(context)
        .size;
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
                    children: <Widget>[
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
            height: size.height * .35,
            decoration: BoxDecoration(
              color: Color(0xFF01579B),
            ),
          ),
          Form(
            key: _formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 90),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Align(
                                    // alignment : Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                        "Ganti Password",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  height: 128,
                                  width: 128,
                                  child: Image.asset(
                                    "assets/icon/register.png",
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Align(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password Lama :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: TextFormField(
                            controller: password,
                            obscureText: true,
                            maxLength: 20,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Password Lama',
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Password Tidak boleh kosong";
                              } else if (value.length < 3) {
                                return "Kolom nama minimal 3 huruf";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Align(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password Baru :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: TextFormField(
                            controller: passwordbaru,
                            obscureText: true,
                            maxLength: 20,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Password Baru',
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Password Tidak boleh kosong";
                              } else if (value.length < 3) {
                                return "Kolom nama minimal 3 huruf";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    Container(
                      // alignment: Alignment.center,
                      width: size.width * 1,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FlatButton(
                            padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                            color: Color(0xFF01579B),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  print("Password Lama : ${password.text}");
                                  print("Password Baru : ${passwordbaru.text}");

                                  edit();
                                }
                                else {
                                  print("Gagal");
                                }
                              });
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) {
                              //       return HomeScreen();
                              //     }),
                              //   );
                            },
                            child: Text(
                              "Ubah Password",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
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
