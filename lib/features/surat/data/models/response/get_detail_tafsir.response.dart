import 'package:json_annotation/json_annotation.dart';
part 'get_detail_tafsir.response.g.dart';

@JsonSerializable()
class GetDetailTafsirResponse {
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
  List<TafsirResponse>? tafsir;

  GetDetailTafsirResponse(
      {this.nomor,
      this.nama,
      this.namaLatin,
      this.jumlahAyat,
      this.tempatTurun,
      this.arti,
      this.deskripsi,
      this.audio,
      this.status,
      this.tafsir});

  factory GetDetailTafsirResponse.fromJson(Map<String, dynamic> json) {
    return _$GetDetailTafsirResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDetailTafsirResponseToJson(this);
}

@JsonSerializable()
class TafsirResponse {
  int? id;
  int? surah;
  int? nomor;
  String? tafsir;

  TafsirResponse({
    this.id,
    this.surah,
    this.nomor,
    this.tafsir,
  });

  factory TafsirResponse.fromJson(Map<String, dynamic> json) {
    return _$TafsirResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TafsirResponseToJson(this);
}
