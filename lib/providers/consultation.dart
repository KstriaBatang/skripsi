import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:flutter_app2/models/consultation.dart';
import 'package:flutter_app2/constants.dart';

class ConsultationProvider with ChangeNotifier {
  List<Consultation> _consultation = [];

  List<Consultation> get list {
    return [..._consultation];
  }

  Future<void> getList({
    @required String token,
    @required int tujuan,
    @required int monthlyRevenue,
  }) async {
    final params = json.encode({
      "nomimal_tujuan": tujuan,
      "monthly_revenue": monthlyRevenue,
    });

    final Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Bearer $token"};

    try {
      final res = await http.post(
        'http://' + apiUrl + '/api/consultation',
        body: params,
        headers: headers,
      );
      final List data = json.decode(res.body)['result'];
      final List<Consultation> loadedConsultation = [];

      data.asMap().forEach((key, value) {
        loadedConsultation.add(
          Consultation(
            id: value['id'],
            currentMonthNominal: value['nominal_bulan_ini'],
            month: value['bulan'],
            name: value['nama'],
            pic: value['pic'],
          ),
        );
      });

      _consultation = loadedConsultation;
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
