import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/features/surat/data/models/response/get_detail_surat.response.dart';
import 'package:e_quran/features/surat/data/models/response/get_detail_tafsir.response.dart';

abstract class SuratDatasource {
  Future<Either<Failure, GetDetailSuratResponse>> postGetSuratDetail(String id);
  Future<Either<Failure, GetDetailTafsirResponse>> postGetDetailTafsir(
      String id);
}
