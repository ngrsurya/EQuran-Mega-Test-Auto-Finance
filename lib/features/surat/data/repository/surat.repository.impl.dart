import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/features/surat/data/datasource/surat.datasource.dart';
import 'package:e_quran/features/surat/data/models/response/get_detail_surat.response.dart';
import 'package:e_quran/features/surat/data/models/response/get_detail_tafsir.response.dart';
import 'package:e_quran/features/surat/domain/repositories/surat.repository.dart';

class SuratRepositoryImpl implements SuratRepository {
  final SuratDatasource suratDatasource;

  const SuratRepositoryImpl({required this.suratDatasource});

  @override
  Future<Either<Failure, GetDetailSuratResponse>> postGetSuratDetail(
      String id) async {
    final result = await suratDatasource.postGetSuratDetail(id);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, GetDetailTafsirResponse>> postGetDetailTafsir(
      String id) async {
    final result = await suratDatasource.postGetDetailTafsir(id);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
