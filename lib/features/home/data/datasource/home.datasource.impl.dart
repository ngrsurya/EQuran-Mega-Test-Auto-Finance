import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/core/resources/network/api_flavor.dart';
import 'package:e_quran/core/resources/network/endpoint.dart';
import 'package:e_quran/features/home/data/datasource/home.datasource.dart';
import 'package:e_quran/features/home/data/models/response/get_daftar_surat.response.dart';

class HomeDatasourceImpl extends HomeDatasource {
  final EQuranApi eQuranApi;

  HomeDatasourceImpl({required this.eQuranApi});

  @override
  Future<Either<Failure, GetDaftarSuratResponse>> postGetDaftarSurat() async {
    try {
      // var version = Version().version;
      // String merchantId = prefHelper.getMerchantId ?? '';
      Response response = await eQuranApi
          .get(true, null)
          .then((value) => value.get(('${Endpoint('DEV').baseUrl}/v2/surat'),
              options: Options(
                headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json",
                },
              )));

      return Future.value(
          Right(GetDaftarSuratResponse.fromJson(response.data)));
    } on DioError catch (e) {
      return Left(GlobalFailure(exception: e.message ?? ''));
    }
  }
}
