import 'package:e_quran/core/resources/network/api_flavor.dart';
import 'package:e_quran/features/home/data/datasource/home.datasource.dart';
import 'package:e_quran/features/home/data/datasource/home.datasource.impl.dart';
import 'package:e_quran/features/home/data/repository/home.repository.impl.dart';
import 'package:e_quran/features/home/domain/repositories/home.repository.dart';
import 'package:e_quran/features/home/domain/usecases/get_data_daftar_surat.dart';
import 'package:e_quran/features/home/presentation/controller/home.controller.dart';
import 'package:e_quran/features/surat/data/datasource/surat.datasource.dart';
import 'package:e_quran/features/surat/data/datasource/surat.datasource.impl.dart';
import 'package:e_quran/features/surat/data/repository/surat.repository.impl.dart';
import 'package:e_quran/features/surat/domain/repositories/surat.repository.dart';
import 'package:e_quran/features/surat/domain/usecases/get_data_detail_surat.dart';
import 'package:e_quran/features/surat/domain/usecases/get_data_detail_tafsir.dart';
import 'package:e_quran/features/surat/presentation/controller/surat.controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //CORE
  sl.registerLazySingleton<EQuranApi>(() => EQuranApi());

  //DATASOURCE
  sl.registerLazySingleton<HomeDatasource>(
      () => HomeDatasourceImpl(eQuranApi: sl()));
  sl.registerLazySingleton<SuratDatasource>(
      () => SuratDatasourceImpl(eQuranApi: sl()));

  //REPOSITORY
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDatasource: sl()));
  sl.registerLazySingleton<SuratRepository>(
      () => SuratRepositoryImpl(suratDatasource: sl()));

  //USECASE
  sl.registerLazySingleton(() => GetDataDaftarSurat(homeRepository: sl()));
  sl.registerLazySingleton(() => GetDataDetailSurat(suratRepository: sl()));
  sl.registerLazySingleton(() => GetDataDetailTafsir(suratRepository: sl()));

  //CONTROLLER
  sl.registerLazySingleton<HomeController>(
      () => HomeController(getDataDaftarSurat: sl()));
  sl.registerLazySingleton<SuratController>(() =>
      SuratController(getDataDetailSurat: sl(), getDataDetailTafsir: sl()));
}
