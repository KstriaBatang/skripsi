import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_app2/forgot-password/ForgotPassword.dart';
import 'package:flutter_app2/register/Register.dart';
import 'package:flutter_app2/dashboard/Dashboard.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _passVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: FormBuilder(
        key: globalFormKey,
        child: Column(
          children: [
            FormBuilderTextField(
              attribute: 'email',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
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
              validators: [
                FormBuilderValidators.required(errorText: 'harus terisi'),
                FormBuilderValidators.email(errorText: 'email tidak valid'),
              ],
            ),
            SizedBox(height: 15),
            FormBuilderTextField(
              attribute: 'password',
              textInputAction: TextInputAction.done,
              controller: passwordController,
              obscureText: _passVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: _passVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _passVisible = !_passVisible;
                    });
                  },
                ),
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
              validators: [
                FormBuilderValidators.required(errorText: 'harus terisi'),
                FormBuilderValidators.minLength(6, errorText: 'minimal 6 karakter'),
              ],
            ),
            SizedBox(height: 15),
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
                              "Masuk",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DashboardPage(),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Belum punya akun ?',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Daftar Disini',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => RegisterPage(),
                            ),
                          );
                        },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Atau',
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width / 2 - 20,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      highlightColor: Colors.black12,
                      child: Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icon/google.png',
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Google',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  width: size.width / 2 - 20,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      highlightColor: Colors.black12,
                      child: Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icon/facebook.png',
                              width: 60,
                              height: 60,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Facebook',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Lupa Password ?',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ForgotPasswordPage(),
                          ),
                        );
                      },
                  ),
                ),
                Text(
                  ' Pulihkan akun Anda',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
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
