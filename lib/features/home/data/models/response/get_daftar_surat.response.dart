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
  @JsonKey(name: 'namaLatin')
  String? namaLatin;
  @JsonKey(name: 'jumlahAyat')
  int? jumlahAyat;
  @JsonKey(name: 'tempatTurun')
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
