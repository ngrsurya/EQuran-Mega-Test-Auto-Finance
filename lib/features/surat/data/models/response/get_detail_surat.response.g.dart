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
      namaLatin: json['namaLatin'] as String?,
      jumlahAyat: (json['jumlahAyat'] as num?)?.toInt(),
      tempatTurun: json['tempatTurun'] as String?,
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      audioFull: json['audioFull'] == null
          ? null
          : AudioResponse.fromJson(json['audioFull'] as Map<String, dynamic>),
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
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audioFull': instance.audioFull,
      'status': instance.status,
      'ayat': instance.ayat,
    };

AyatResponse _$AyatResponseFromJson(Map<String, dynamic> json) => AyatResponse(
      nomorAyat: (json['nomorAyat'] as num?)?.toInt(),
      teksArab: json['teksArab'] as String?,
      teksLatin: json['teksLatin'] as String?,
      teksIndonesia: json['teksIndonesia'] as String?,
      audio: json['audio'] == null
          ? null
          : AudioResponse.fromJson(json['audio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AyatResponseToJson(AyatResponse instance) =>
    <String, dynamic>{
      'nomorAyat': instance.nomorAyat,
      'teksArab': instance.teksArab,
      'teksLatin': instance.teksLatin,
      'teksIndonesia': instance.teksIndonesia,
      'audio': instance.audio,
    };

AudioResponse _$AudioResponseFromJson(Map<String, dynamic> json) =>
    AudioResponse(
      no1: json['01'] as String?,
      no2: json['02'] as String?,
      no3: json['03'] as String?,
      no4: json['04'] as String?,
      no5: json['05'] as String?,
    );

Map<String, dynamic> _$AudioResponseToJson(AudioResponse instance) =>
    <String, dynamic>{
      '01': instance.no1,
      '02': instance.no2,
      '03': instance.no3,
      '04': instance.no4,
      '05': instance.no5,
    };
