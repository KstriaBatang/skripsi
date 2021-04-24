import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app2/models/bank.dart';
import 'package:flutter_app2/constants.dart';

class BankProvider with ChangeNotifier {
  List<Bank> _banks = [];

  List<Bank> get list {
    return [..._banks];
  }

  Future<void> getList({
    @required String token,
    String search = '',
    String minDeposit = '',
    String bunga = '',
    String golBuku = '',
  }) async {
    final params = {
      'form[nama]': search,
      'form[min_deposit]': minDeposit,
      'form[bunga]': bunga,
      'form[jenis_buku]': golBuku,
    };

    final Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Bearer $token"};

    final url = Uri.http(apiUrl, 'api/bank', params);

    try {
      final res = await http.get(url, headers: headers);
      final List data = json.decode(res.body)['result'];
      final List<Bank> loadedBank = [];
      print(url);
      data.asMap().forEach((key, value) {
        loadedBank.add(
          Bank(
            id: value['id'],
            bunga: double.parse(value['bunga'].toString()),
            jenisBuku: value['jenis_buku'],
            minDeposit: value['min_deposit'],
            nama: value['nama'],
            pic: value['pic'],
            tanggalBerdiri: value['tanggal_berdiri'],
            web: value['web'],
          ),
        );
      });

      _banks = loadedBank;
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
