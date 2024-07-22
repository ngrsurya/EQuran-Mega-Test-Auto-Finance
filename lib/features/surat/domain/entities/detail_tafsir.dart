import 'package:equatable/equatable.dart';

class DetailTafsirInfo extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;
  final bool status;
  final List<TafsirInfo> tafsir;

  const DetailTafsirInfo(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.deskripsi,
      required this.audio,
      required this.status,
      required this.tafsir});

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
        tafsir
      ];

  DetailTafsirInfo copyWith(
      {int? nomor,
      String? nama,
      String? namaLatin,
      int? jumlahAyat,
      String? tempatTurun,
      String? arti,
      String? deskripsi,
      String? audio,
      bool? status,
      List<TafsirInfo>? tafsir}) {
    return DetailTafsirInfo(
        nomor: nomor ?? this.nomor,
        nama: nama ?? this.nama,
        namaLatin: namaLatin ?? this.namaLatin,
        jumlahAyat: jumlahAyat ?? this.jumlahAyat,
        tempatTurun: tempatTurun ?? this.tempatTurun,
        arti: arti ?? this.arti,
        deskripsi: deskripsi ?? this.deskripsi,
        audio: audio ?? this.audio,
        status: status ?? this.status,
        tafsir: tafsir ?? this.tafsir);
  }
}

class TafsirInfo extends Equatable {
  final int id;
  final int surah;
  final int nomor;
  final String tafsir;

  const TafsirInfo({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.tafsir,
  });

  @override
  List<Object> get props => [id, surah, nomor, tafsir];

  TafsirInfo copyWith({int? id, int? surah, int? nomor, String? tafsir}) {
    return TafsirInfo(
      id: id ?? this.id,
      surah: surah ?? this.surah,
      nomor: nomor ?? this.nomor,
      tafsir: tafsir ?? this.tafsir,
    );
  }
}
