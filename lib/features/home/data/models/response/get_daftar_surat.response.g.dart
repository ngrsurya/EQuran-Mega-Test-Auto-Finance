// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_daftar_surat.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDaftarSuratResponse _$GetDaftarSuratResponseFromJson(
        Map<String, dynamic> json) =>
    GetDaftarSuratResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetDaftarSuratResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDaftarSuratResponseToJson(
        GetDaftarSuratResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetDaftarSuratResponseData _$GetDaftarSuratResponseDataFromJson(
        Map<String, dynamic> json) =>
    GetDaftarSuratResponseData(
      nomor: (json['nomor'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      namaLatin: json['namaLatin'] as String?,
      jumlahAyat: (json['jumlahAyat'] as num?)?.toInt(),
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      tempatTurun: json['tempatTurun'] as String?,
    );

Map<String, dynamic> _$GetDaftarSuratResponseDataToJson(
        GetDaftarSuratResponseData instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
    };
