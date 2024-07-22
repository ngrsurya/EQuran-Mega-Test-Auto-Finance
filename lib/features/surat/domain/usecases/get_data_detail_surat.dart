import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/core/utils/use_case/usecase.dart';
import 'package:e_quran/features/surat/domain/entities/detail_surat.dart';
import 'package:e_quran/features/surat/domain/repositories/surat.repository.dart';

class GetDataDetailSurat implements UseCase<DetailSuratInfo, String> {
  final SuratRepository suratRepository;
  GetDataDetailSurat({required this.suratRepository});

  @override
  Future<Either<Failure, DetailSuratInfo>> call(String id) async {
    final result = await suratRepository.postGetSuratDetail(id);
    return result.fold(
        (l) => Left(l),
        (r) => Right(DetailSuratInfo(
            nomor: r.nomor ?? 0,
            nama: r.nama ?? '',
            namaLatin: r.namaLatin ?? '',
            jumlahAyat: r.jumlahAyat ?? 0,
            tempatTurun: r.tempatTurun ?? '',
            arti: r.arti ?? '',
            deskripsi: r.deskripsi ?? '',
            audio: r.audio ?? '',
            status: r.status ?? false,
            ayat: r.ayat!
                .map((e) => AyatInfo(
                    nomor: e.nomor ?? 0,
                    id: e.id ?? 0,
                    surah: e.surah ?? 0,
                    ar: e.ar ?? '',
                    tr: e.tr ?? '',
                    idn: e.idn ?? ''))
                .toList())));
  }
}
