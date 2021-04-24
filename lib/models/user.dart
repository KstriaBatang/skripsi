import 'package:flutter_app2/utils/enums.dart';

class User {
  final int id;
  final String email;
  final String namaDepan;
  final String namaBelakang;
  final JenisKelamin jenisKelamin;
  final String statusPekerjaan;
  final DateTime tanggalLahir;
  final String noHandphone;
  final String token;

  User({
    this.id,
    this.email,
    this.namaDepan,
    this.namaBelakang,
    this.jenisKelamin,
    this.statusPekerjaan,
    this.tanggalLahir,
    this.noHandphone,
    this.token,
  });
}
