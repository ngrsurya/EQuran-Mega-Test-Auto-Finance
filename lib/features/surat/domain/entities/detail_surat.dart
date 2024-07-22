import 'package:equatable/equatable.dart';

class DetailSuratInfo extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;
  final bool status;
  final List<AyatInfo> ayat;

  const DetailSuratInfo(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.deskripsi,
      required this.audio,
      required this.status,
      required this.ayat});

  @override
  List<Object> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
        tempatTurun,
        arti,
        deskripsi,
        audio,
        status,
        ayat
      ];

  DetailSuratInfo copyWith(
      {int? nomor,
      String? nama,
      String? namaLatin,
      int? jumlahAyat,
      String? tempatTurun,
      String? arti,
      String? deskripsi,
      String? audio,
      bool? status,
      List<AyatInfo>? ayat}) {
    return DetailSuratInfo(
        nomor: nomor ?? this.nomor,
        nama: nama ?? this.nama,
        namaLatin: namaLatin ?? this.namaLatin,
        jumlahAyat: jumlahAyat ?? this.jumlahAyat,
        tempatTurun: tempatTurun ?? this.tempatTurun,
        arti: arti ?? this.arti,
        deskripsi: deskripsi ?? this.deskripsi,
        audio: audio ?? this.audio,
        status: status ?? this.status,
        ayat: ayat ?? this.ayat);
  }
}

class AyatInfo extends Equatable {
  final int id;
  final int surah;
  final int nomor;
  final String ar;
  final String tr;
  final String idn;

  const AyatInfo(
      {required this.id,
      required this.surah,
      required this.nomor,
      required this.ar,
      required this.tr,
      required this.idn});

  @override
  List<Object> get props => [id, surah, nomor, ar, tr, idn];

  AyatInfo copyWith(
      {int? id, int? surah, int? nomor, String? ar, String? tr, String? idn}) {
    return AyatInfo(
        id: id ?? this.id,
        surah: surah ?? this.surah,
        nomor: nomor ?? this.nomor,
        ar: ar ?? this.ar,
        tr: tr ?? this.tr,
        idn: idn ?? this.idn);
  }
}
