import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app2/utils/enums.dart';
import 'package:flutter_app2/utils/HttpException.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_app2/constants.dart';

class AuthProvider with ChangeNotifier {
  final formatter = new DateFormat('yyyy-MM-dd');
  User _userdata;

  bool get isAuth {
    return _userdata != null;
  }

  User get user {
    return _userdata;
  }

  Future<void> login(String email, String pass) async {
    const Map<String, String> headers = {"Content-type": "application/json"};
    final String jsonData = json.encode({
      "email": email,
      "password": pass,
    });

    try {
      final res = await http.post(
        'http://' + apiUrl + '/api/auth/login',
        body: jsonData,
        headers: headers,
      );
      print(jsonData);
      final bool status = json.decode(res.body)['status'];

      if (!status) throw HttpException('Kombinasi email dan password tidak sesuai.');

      final data = json.decode(res.body)['result'];
      print(data);

      _userdata = User(
        email: data['email'],
        token: data['token'],
        id: data['id'],
        tanggalLahir: formatter.parse(data['tanggal_lahir']),
        namaBelakang: data['nama_belakang'],
        namaDepan: data['nama_depan'],
        noHandphone: data['no_hp'],
        statusPekerjaan: data['status_pekerjaan'],
        jenisKelamin: data['jenis_kelamin'] == 'L' ? JenisKelamin.laki : JenisKelamin.perempuan,
      );

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'email': data['email'],
          'token': data['token'],
          'id': data['id'],
          'tanggalLahir': data['tanggal_lahir'].toString(),
          'namaBelakang': data['nama_belakang'],
          'namaDepan': data['nama_depan'],
          'noHandphone': data['no_hp'],
          'statusPekerjaan': data['status_pekerjaan'],
          'jenisKelamin': data['jenis_kelamin']
        },
      );
      prefs.setString('userData', userData);

      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  Future<void> register(
    String namaDepan,
    String namaBelakang,
    DateTime birthOfDate,
    JenisKelamin jenisKelamin,
    String noHandpone,
    String statusPekerjaan,
    String email,
    String password,
    String confirmationPassword,
  ) async {
    const Map<String, String> headers = {"Content-type": "application/json"};

    String jenis = jenisKelamin == JenisKelamin.laki ? 'L' : 'P';

    String jsonData = json.encode({
      'nama_depan': namaDepan,
      'nama_belakang': namaBelakang,
      'jenis_kelamin': jenis,
      'no_hp': noHandpone,
      'status_pekerjaan': statusPekerjaan,
      'tanggal_lahir': formatter.format(birthOfDate),
      'email': email,
      'password': password,
      'confirmation_password': confirmationPassword
    });
    try {
      final res = await http.post(
        'http://' + apiUrl + '/api/auth/register',
        body: jsonData,
        headers: headers,
      );

      final bool status = json.decode(res.body)['status'];
      if (!status) throw HttpException(json.decode(res.body)['err'].toString().replaceAll(RegExp(r'[\{\}\:]'), ''));
    } catch (err) {
      throw (err);
    }
  }

  Future<void> logout() async {
    // const Map<String, String> headers = {"Content-type": "application/json"};

    // final String jsonData = json.encode({'email': _userdata.email, 'token': _userdata.token});

    try {
      // final res = await http.post(
      //   apiUrl + '/api/auth/logout',
      //   headers: headers,
      //   body: jsonData,
      // );

      // final bool status = json.decode(res.body)['status'];

      // if (!status) throw HttpException(json.decode(res.body)['error']);

      _userdata = null;
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('userData');

      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('userData')) {
      return false;
    }

    final extractedData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    print(extractedData['tanggalLahir']);
    _userdata = User(
      email: extractedData['email'],
      token: extractedData['token'],
      id: extractedData['id'],
      tanggalLahir: formatter.parse(extractedData['tanggalLahir']),
      namaBelakang: extractedData['namaBelakang'],
      namaDepan: extractedData['namaDepan'],
      noHandphone: extractedData['noHandphone'],
      statusPekerjaan: extractedData['statusPekerjaan'],
      jenisKelamin: extractedData['jenisKelamin'] == 'L' ? JenisKelamin.laki : JenisKelamin.perempuan,
    );

    notifyListeners();
    return true;
  }
}
