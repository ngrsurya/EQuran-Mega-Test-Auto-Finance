import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/core/resources/network/api_flavor.dart';
import 'package:e_quran/core/resources/network/endpoint.dart';
import 'package:e_quran/features/surat/data/datasource/surat.datasource.dart';
import 'package:e_quran/features/surat/data/models/response/get_detail_surat.response.dart';
import 'package:e_quran/features/surat/data/models/response/get_detail_tafsir.response.dart';

class SuratDatasourceImpl extends SuratDatasource {
  final EQuranApi eQuranApi;

  SuratDatasourceImpl({required this.eQuranApi});

  @override
  Future<Either<Failure, GetDetailSuratResponse>> postGetSuratDetail(
      String id) async {
    try {
      Response response = await eQuranApi.get(true, null).then(
          (value) => value.get(('${Endpoint('DEV').baseUrl}/v2/surat/$id'),
              options: Options(
                headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json",
                },
              )));

      return Future.value(
          Right(GetDetailSuratResponse.fromJson(response.data['data'])));
    } on DioError catch (e) {
      return Left(GlobalFailure(exception: e.message ?? ''));
    }
  }

  @override
  Future<Either<Failure, GetDetailTafsirResponse>> postGetDetailTafsir(
      String id) async {
    try {
      Response response = await eQuranApi
          .get(true, null)
          .then((value) => value.get(('${Endpoint('DEV').baseUrl}/tafsir/$id'),
              options: Options(
                headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json",
                },
              )));

      return Future.value(
          Right(GetDetailTafsirResponse.fromJson(response.data)));
    } on DioError catch (e) {
      return Left(GlobalFailure(exception: e.message ?? ''));
    }
  }
}
