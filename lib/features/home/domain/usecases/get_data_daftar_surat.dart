import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/core/utils/use_case/usecase.dart';
import 'package:e_quran/features/home/domain/entities/daftar_surat.dart';
import 'package:e_quran/features/home/domain/repositories/home.repository.dart';

class GetDataDaftarSurat implements UseCaseNoParam<DaftarSuratInfo> {
  final HomeRepository homeRepository;
  GetDataDaftarSurat({required this.homeRepository});

  @override
  Future<Either<Failure, DaftarSuratInfo>> call() async {
    final result = await homeRepository.postGetDaftarSurat();
    return result.fold(
        (l) => Left(l),
        (r) => Right(DaftarSuratInfo(
            data: r.data!
                .map((e) => DaftarSuratInfoData(
                    nomor: e.nomor ?? 0,
                    nama: e.nama ?? '',
                    namaLatin: e.namaLatin ?? '',
                    jumlahAyat: e.jumlahAyat ?? 0,
                    tempatTurun: e.tempatTurun ?? '',
                    arti: e.arti ?? '',
                    deskripsi: e.deskripsi ?? ''))
                .toList())));
  }
}
