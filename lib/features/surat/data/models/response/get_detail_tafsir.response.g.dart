// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_tafsir.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailTafsirResponse _$GetDetailTafsirResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailTafsirResponse(
      nomor: (json['nomor'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      namaLatin: json['nama_latin'] as String?,
      jumlahAyat: (json['jumlah_ayat'] as num?)?.toInt(),
      tempatTurun: json['tempat_turun'] as String?,
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      audio: json['audio'] as String?,
      status: json['status'] as bool?,
      tafsir: (json['tafsir'] as List<dynamic>?)
          ?.map((e) => TafsirResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDetailTafsirResponseToJson(
        GetDetailTafsirResponse instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'nama_latin': instance.namaLatin,
      'jumlah_ayat': instance.jumlahAyat,
      'tempat_turun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audio': instance.audio,
      'status': instance.status,
      'tafsir': instance.tafsir,
    };

TafsirResponse _$TafsirResponseFromJson(Map<String, dynamic> json) =>
    TafsirResponse(
      id: (json['id'] as num?)?.toInt(),
      surah: (json['surah'] as num?)?.toInt(),
      nomor: (json['nomor'] as num?)?.toInt(),
      tafsir: json['tafsir'] as String?,
    );

Map<String, dynamic> _$TafsirResponseToJson(TafsirResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surah': instance.surah,
      'nomor': instance.nomor,
      'tafsir': instance.tafsir,
    };
