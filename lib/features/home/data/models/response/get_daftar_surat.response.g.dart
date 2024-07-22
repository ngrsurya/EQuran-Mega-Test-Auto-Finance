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
      namaLatin: json['name_latin'] as String?,
      jumlahAyat: (json['jumlah_ayat'] as num?)?.toInt(),
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      tempatTurun: json['tempat_turun'] as String?,
    );

Map<String, dynamic> _$GetDaftarSuratResponseDataToJson(
        GetDaftarSuratResponseData instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'name_latin': instance.namaLatin,
      'jumlah_ayat': instance.jumlahAyat,
      'tempat_turun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
    };
