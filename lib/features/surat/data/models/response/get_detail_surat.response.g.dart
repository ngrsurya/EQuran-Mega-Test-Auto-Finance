// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_surat.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailSuratResponse _$GetDetailSuratResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailSuratResponse(
      nomor: (json['nomor'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      namaLatin: json['nama_latin'] as String?,
      jumlahAyat: (json['jumlah_ayat'] as num?)?.toInt(),
      tempatTurun: json['tempat_turun'] as String?,
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      audio: json['audio'] as String?,
      status: json['status'] as bool?,
      ayat: (json['ayat'] as List<dynamic>?)
          ?.map((e) => AyatResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDetailSuratResponseToJson(
        GetDetailSuratResponse instance) =>
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
      'ayat': instance.ayat,
    };

AyatResponse _$AyatResponseFromJson(Map<String, dynamic> json) => AyatResponse(
      id: (json['id'] as num?)?.toInt(),
      surah: (json['surah'] as num?)?.toInt(),
      nomor: (json['nomor'] as num?)?.toInt(),
      ar: json['ar'] as String?,
      tr: json['tr'] as String?,
      idn: json['idn'] as String?,
    );

Map<String, dynamic> _$AyatResponseToJson(AyatResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surah': instance.surah,
      'nomor': instance.nomor,
      'ar': instance.ar,
      'tr': instance.tr,
      'idn': instance.idn,
    };
