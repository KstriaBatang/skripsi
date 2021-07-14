import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/scenes/formdaftar.dart';
import 'package:flutter_app2/widgets/biodata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var url = "http://192.168.0.105/Flutter/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": password.text,
    });

    var data = json.decode((response.body));
    print(data);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Gagal!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      Fluttertoast.showToast(
          msg: "Selamat datang " + data[0]['nama_depan'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      var storage = FlutterSecureStorage();
      storage.write(key: "email", value: data[0]['email']);
      storage.write(key: "nama_depan", value: data[0]['nama_depan']);
      storage.write(key: "nama_belakang", value: data[0]['nama_belakang']);
      storage.write(key: "tgl_lahir", value: data[0]['tgl_lahir']);
      storage.write(key: "jenis_kelamin", value: data[0]['jenis_kelamin']);
      storage.write(key: "stat_pekerjaan", value: data[0]['stat_pekerjaan']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }


  @override
  final _formKey = GlobalKey <FormState>();


  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                            child: Image.asset(
                              "assets/icon/bank.png",
                              height: 100,
                              width: 100,
                            )),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Selamat Datang",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
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
                            "Email :",
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
                      controller: email,
                      validator: (value) =>
                      EmailValidator.validate(value)
                          ? null
                          : "Masukan dengan format email",
                      maxLength: 30,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Email'),
                    ),
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
                            "Password :",
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
                          hintText: 'Password',
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
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FlatButton(
                        padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                        color: Color(0xFF01579B),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              login();
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
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Align(
                        child: Container(
                          alignment: Alignment.center,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return daftar();
                                }),
                              );
                            },
                            child: Text(
                              "Belum Punya Akun ? Daftar Disini",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
