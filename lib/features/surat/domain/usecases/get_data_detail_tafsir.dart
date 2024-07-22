import 'package:dartz/dartz.dart';
import 'package:e_quran/core/error/failures.dart';
import 'package:e_quran/core/utils/use_case/usecase.dart';
import 'package:e_quran/features/surat/domain/entities/detail_tafsir.dart';
import 'package:e_quran/features/surat/domain/repositories/surat.repository.dart';

class GetDataDetailTafsir implements UseCase<DetailTafsirInfo, String> {
  final SuratRepository suratRepository;
  GetDataDetailTafsir({required this.suratRepository});

  @override
  Future<Either<Failure, DetailTafsirInfo>> call(String id) async {
    final result = await suratRepository.postGetDetailTafsir(id);
    return result.fold(
        (l) => Left(l),
        (r) => Right(DetailTafsirInfo(
            nomor: r.nomor ?? 0,
            nama: r.nama ?? '',
            namaLatin: r.namaLatin ?? '',
            jumlahAyat: r.jumlahAyat ?? 0,
            tempatTurun: r.tempatTurun ?? '',
            arti: r.arti ?? '',
            deskripsi: r.deskripsi ?? '',
            audio: r.audio ?? '',
            status: r.status ?? false,
            tafsir: r.tafsir!
                .map((e) => TafsirInfo(
                      nomor: e.nomor ?? 0,
                      id: e.id ?? 0,
                      surah: e.surah ?? 0,
                      tafsir: e.tafsir ?? '',
                    ))
                .toList())));
  }
}
