import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app2/providers/auth.dart';
import 'package:flutter_app2/utils/HttpException.dart';
import 'package:flutter_app2/utils/enums.dart';

class FormRegister extends StatefulWidget {
  @override
  _ForHRegisterState createState() => _ForHRegisterState();
}

class _ForHRegisterState extends State<FormRegister> {
  final GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController statusPekerjaanController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();

  bool _isLoading = false;
  bool _passVisible = false;
  bool _confirmPassVisible = false;
  DateTime parsedDate = DateTime.parse(new DateTime.now().toString());
  DateTime _birthDate;
  JenisKelamin _jenisKelamin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: size.height * .08,
          bottom: padding.bottom + 10,
        ),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: globalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Depan :',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'first name',
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  controller: firstNameController,
                  maxLength: 12,
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
                ),
                SizedBox(height: 15),
                Text(
                  'Nama Belakang :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'last name',
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  controller: lastNameController,
                  maxLength: 12,
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
                ),
                SizedBox(height: 15),
                Text(
                  'Jenis Kelamin :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderRadioGroup(
                  name: 'jenis kelamin',
                  options: [
                    FormBuilderFieldOption(
                      child: Text('Laki-Laki'),
                      value: JenisKelamin.laki,
                    ),
                    FormBuilderFieldOption(
                      child: Text('Perempuan'),
                      value: JenisKelamin.perempuan,
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
                    () => _jenisKelamin = value,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Status Pekerjaan :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'status pekerjaan',
                  textInputAction: TextInputAction.next,
                  controller: statusPekerjaanController,
                  maxLength: 50,
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
                ),
                SizedBox(height: 15),
                Text(
                  'Tanggal Lahir :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderDateTimePicker(
                  name: 'tgl lahir',
                  inputType: InputType.date,
                  firstDate: DateTime(1700),
                  lastDate: DateTime(parsedDate.year, 12),
                  format: DateFormat('yyyy-MM-dd'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
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
                    () => _birthDate = value,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'No. Handphone :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'no hp',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: noHpController,
                  maxLength: 13,
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
                ),
                SizedBox(height: 15),
                Text(
                  'Email :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'email',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context, errorText: 'harus terisi'),
                    FormBuilderValidators.email(context, errorText: 'email tidak valid'),
                  ]),
                ),
                SizedBox(height: 15),
                Text(
                  'Password :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'password',
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  obscureText: !_passVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: !_passVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context, errorText: 'harus terisi'),
                    FormBuilderValidators.minLength(context, 6, errorText: 'minimal 6 karakter'),
                    (value) {
                      Pattern patternSmallChar = r'([a-z])';
                      Pattern patternCapitalChar = r'([A-Z])';
                      Pattern patternNumber = r'([0-9])';

                      if (value.isEmpty) return "Password tidak boleh kosong";
                      if (value.length < 6) return "Password harus memiliki 6 karakter minimal";
                      if (!new RegExp(patternSmallChar).hasMatch(value)) return "Password harus memiliki 1 huruf kecil";
                      if (!new RegExp(patternCapitalChar).hasMatch(value)) return "Password harus memiliki 1 huruf besar";
                      if (!new RegExp(patternNumber).hasMatch(value)) return "Password harus memiliki 1 angka";
                      return null;
                    }
                  ]),
                ),
                SizedBox(height: 15),
                Text(
                  'Konfirmasi Password :',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'password confirmation',
                  textInputAction: TextInputAction.done,
                  controller: passwordConfirmationController,
                  obscureText: !_confirmPassVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: !_confirmPassVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _confirmPassVisible = !_confirmPassVisible;
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context, errorText: 'harus terisi'),
                    (val) {
                      if (val != passwordController.text) return 'tidak sama dengan password';
                      return null;
                    },
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
                                  "Daftar",
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
                        if (validateAndSave()) {
                          setState(() => _isLoading = true);

                          try {
                            await Provider.of<AuthProvider>(
                              context,
                              listen: false,
                            ).register(
                              firstNameController.text,
                              lastNameController.text,
                              _birthDate,
                              _jenisKelamin,
                              noHpController.text,
                              statusPekerjaanController.text,
                              emailController.text,
                              passwordController.text,
                              passwordConfirmationController.text,
                            );
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(msg: 'Berhasil daftar. Silakan Login');
                          } on HttpException catch (err) {
                            setState(() => _isLoading = false);
                            Fluttertoast.showToast(
                              msg: err.toString(),
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } catch (err) {
                            setState(() => _isLoading = false);
                            Fluttertoast.showToast(
                              msg: 'Gagal melakukan pendaftaran. Silakan coba lagi.',
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          }
                        } else {
                          setState(() => _isLoading = false);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
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
