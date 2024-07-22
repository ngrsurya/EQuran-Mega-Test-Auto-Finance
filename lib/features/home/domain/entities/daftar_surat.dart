import 'package:equatable/equatable.dart';

class DaftarSuratInfo extends Equatable {
  final List<DaftarSuratInfoData> data;

  const DaftarSuratInfo({required this.data});

  @override
  List<Object> get props => [data];

  DaftarSuratInfo copyWith({List<DaftarSuratInfoData>? data}) {
    return DaftarSuratInfo(data: data ?? this.data);
  }
}

class DaftarSuratInfoData extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;

  const DaftarSuratInfoData(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.deskripsi});

  @override
  List<Object> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
        tempatTurun,
        arti,
        deskripsi,
      ];

  DaftarSuratInfoData copyWith(
      {int? nomor,
      String? nama,
      String? namaLatin,
      int? jumlahAyat,
      String? tempatTurun,
      String? arti,
      String? deskripsi}) {
    return DaftarSuratInfoData(
        nomor: nomor ?? this.nomor,
        nama: nama ?? this.nama,
        namaLatin: namaLatin ?? this.namaLatin,
        jumlahAyat: jumlahAyat ?? this.jumlahAyat,
        tempatTurun: tempatTurun ?? this.tempatTurun,
        arti: arti ?? this.arti,
        deskripsi: deskripsi ?? this.deskripsi);
  }

  toList() {}
}
