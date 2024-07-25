import 'package:json_annotation/json_annotation.dart';
part 'get_detail_surat.response.g.dart';

@JsonSerializable()
class GetDetailSuratResponse {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  AudioResponse? audioFull;
  bool? status;
  List<AyatResponse>? ayat;

  GetDetailSuratResponse(
      {this.nomor,
      this.nama,
      this.namaLatin,
      this.jumlahAyat,
      this.tempatTurun,
      this.arti,
      this.deskripsi,
      this.audioFull,
      this.status,
      this.ayat});

  factory GetDetailSuratResponse.fromJson(Map<String, dynamic> json) {
    return _$GetDetailSuratResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDetailSuratResponseToJson(this);
}

@JsonSerializable()
class AyatResponse {
  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  AudioResponse? audio;

  AyatResponse(
      {this.nomorAyat,
      this.teksArab,
      this.teksLatin,
      this.teksIndonesia,
      this.audio});

  factory AyatResponse.fromJson(Map<String, dynamic> json) {
    return _$AyatResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AyatResponseToJson(this);
}

@JsonSerializable()
class AudioResponse {
  @JsonKey(name: '01')
  String? no1;
  @JsonKey(name: '02')
  String? no2;
  @JsonKey(name: '03')
  String? no3;
  @JsonKey(name: '04')
  String? no4;
  @JsonKey(name: '05')
  String? no5;

  AudioResponse({this.no1, this.no2, this.no3, this.no4, this.no5});

  factory AudioResponse.fromJson(Map<String, dynamic> json) {
    return _$AudioResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AudioResponseToJson(this);
}
