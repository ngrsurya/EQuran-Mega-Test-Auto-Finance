import 'package:equatable/equatable.dart';

class DetailSuratInfo extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final AudioInfo audioFull;
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
      required this.audioFull,
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
        audioFull,
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
      AudioInfo? audioFull,
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
        audioFull: audioFull ?? this.audioFull,
        status: status ?? this.status,
        ayat: ayat ?? this.ayat);
  }
}

class AudioInfo extends Equatable {
  final String no1;
  final String no2;
  final String no3;
  final String no4;
  final String no5;

  const AudioInfo(
      {required this.no1,
      required this.no2,
      required this.no3,
      required this.no4,
      required this.no5});

  @override
  List<Object> get props => [no1, no2, no3, no4, no5];

  AudioInfo copyWith(
      {String? no1, String? no2, String? no3, String? no4, String? no5}) {
    return AudioInfo(
        no1: no1 ?? this.no1,
        no2: no2 ?? this.no2,
        no3: no3 ?? this.no3,
        no4: no4 ?? this.no4,
        no5: no5 ?? this.no5);
  }
}

class AyatInfo extends Equatable {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final AudioInfo audio;

  const AyatInfo({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  @override
  List<Object> get props =>
      [nomorAyat, teksArab, teksLatin, teksIndonesia, audio];

  AyatInfo copyWith(
      {int? nomorAyat,
      String? teksArab,
      String? teksLatin,
      String? teksIndonesia,
      AudioInfo? audio}) {
    return AyatInfo(
      nomorAyat: nomorAyat ?? this.nomorAyat,
      teksArab: teksArab ?? this.teksArab,
      teksLatin: teksLatin ?? this.teksLatin,
      teksIndonesia: teksIndonesia ?? this.teksIndonesia,
      audio: audio ?? this.audio,
    );
  }
}
