import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/features/home/data/models/response/get_daftar_surat.response.dart';

abstract class HomeRepository {
  Future<Either<Failure, GetDaftarSuratResponse>> postGetDaftarSurat();
}
