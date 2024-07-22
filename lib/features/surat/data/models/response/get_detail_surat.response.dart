import 'package:json_annotation/json_annotation.dart';
part 'get_detail_surat.response.g.dart';

@JsonSerializable()
class GetDetailSuratResponse {
  int? nomor;
  String? nama;
  @JsonKey(name: 'nama_latin')
  String? namaLatin;
  @JsonKey(name: 'jumlah_ayat')
  int? jumlahAyat;
  @JsonKey(name: 'tempat_turun')
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
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
      this.audio,
      this.status,
      this.ayat});

  factory GetDetailSuratResponse.fromJson(Map<String, dynamic> json) {
    return _$GetDetailSuratResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDetailSuratResponseToJson(this);
}

@JsonSerializable()
class AyatResponse {
  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  AyatResponse({
    this.id,
    this.surah,
    this.nomor,
    this.ar,
    this.tr,
    this.idn,
  });

  factory AyatResponse.fromJson(Map<String, dynamic> json) {
    return _$AyatResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AyatResponseToJson(this);
}
