import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/features/home/data/datasource/home.datasource.dart';
import 'package:e_quran/features/home/data/models/response/get_daftar_surat.response.dart';
import 'package:e_quran/features/home/domain/repositories/home.repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;

  const HomeRepositoryImpl({required this.homeDatasource});

  @override
  Future<Either<Failure, GetDaftarSuratResponse>> postGetDaftarSurat() async {
    final result = await homeDatasource.postGetDaftarSurat();
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
