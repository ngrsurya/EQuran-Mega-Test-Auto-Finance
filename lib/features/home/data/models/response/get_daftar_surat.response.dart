import 'package:json_annotation/json_annotation.dart';
part 'get_daftar_surat.response.g.dart';

@JsonSerializable()
class GetDaftarSuratResponse {
  List<GetDaftarSuratResponseData>? data;
  GetDaftarSuratResponse({this.data});

  factory GetDaftarSuratResponse.fromJson(Map<String, dynamic> json) {
    return _$GetDaftarSuratResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDaftarSuratResponseToJson(this);
}

@JsonSerializable()
class GetDaftarSuratResponseData {
  int? nomor;
  String? nama;
  @JsonKey(name: 'name_latin')
  String? namaLatin;
  @JsonKey(name: 'jumlah_ayat')
  int? jumlahAyat;
  @JsonKey(name: 'tempat_turun')
  String? tempatTurun;
  String? arti;
  String? deskripsi;

  GetDaftarSuratResponseData(
      {this.nomor,
      this.nama,
      this.namaLatin,
      this.jumlahAyat,
      this.arti,
      this.deskripsi,
      this.tempatTurun});

  factory GetDaftarSuratResponseData.fromJson(Map<String, dynamic> json) {
    return _$GetDaftarSuratResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDaftarSuratResponseDataToJson(this);
}
