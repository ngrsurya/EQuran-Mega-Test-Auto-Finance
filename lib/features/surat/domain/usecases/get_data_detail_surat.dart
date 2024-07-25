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
            audioFull: AudioInfo(
                no1: r.audioFull!.no1 ?? '',
                no2: r.audioFull!.no2 ?? '',
                no3: r.audioFull!.no3 ?? '',
                no4: r.audioFull!.no4 ?? '',
                no5: r.audioFull!.no5 ?? ''),
            status: r.status ?? false,
            ayat: r.ayat!
                .map((e) => AyatInfo(
                      nomorAyat: e.nomorAyat ?? 0,
                      teksArab: e.teksArab ?? '',
                      teksLatin: e.teksLatin ?? '',
                      teksIndonesia: e.teksIndonesia ?? '',
                      audio: AudioInfo(
                          no1: e.audio!.no1 ?? '',
                          no2: e.audio!.no2 ?? '',
                          no3: e.audio!.no3 ?? '',
                          no4: e.audio!.no4 ?? '',
                          no5: e.audio!.no5 ?? ''),
                    ))
                .toList())));
  }
}
