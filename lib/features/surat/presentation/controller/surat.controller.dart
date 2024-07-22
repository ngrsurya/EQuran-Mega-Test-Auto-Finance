import 'package:e_quran/core/utils/snackbar/snackbar_global.dart';
import 'package:e_quran/features/surat/domain/entities/detail_surat.dart';
import 'package:e_quran/features/surat/domain/entities/detail_tafsir.dart';
import 'package:e_quran/features/surat/domain/usecases/get_data_detail_surat.dart';
import 'package:e_quran/features/surat/domain/usecases/get_data_detail_tafsir.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

enum DetailSuratState { initial, getData, error, loading }

enum DetailTarifState { initial, getData, error, loading }

class SuratController extends GetxController {
  GetDataDetailSurat getDataDetailSurat;
  GetDataDetailTafsir getDataDetailTafsir;

  //STATE
  Rx<DetailSuratState> detailSuratState = DetailSuratState.initial.obs;
  Rx<DetailTarifState> detailTarifState = DetailTarifState.initial.obs;

  Rx<bool> showModalTafsir = false.obs;

  //DATA
  Rx<DetailSuratInfo>? detailSuratInfo;
  Rx<DetailTafsirInfo>? detailTarifnfo;

  //TAFSIR
  Rx<String> tafsirTitle = ''.obs;
  Rx<String> tafsirText = ''.obs;

  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> duration = Duration.zero.obs;
  Rx<double> durationPerAyat = 0.0.obs;

  SuratController(
      {required this.getDataDetailSurat, required this.getDataDetailTafsir});

  Future<void> initializedAllData(String suratID, AudioPlayer player) async {
    await doGetDataDetailSurat(suratID);
    await doGetDataDetailTafsir(suratID);

    if (detailSuratInfo != null) {
      setInitiPlayer(player, detailSuratInfo!.value.audio);
    } else {
      onSentNotifSnackBar(
          // ignore: use_build_context_synchronously
          navigator!.context,
          'Error: DetailSuratInfo is null.');
    }
  }

  //------------------------------------------------------------------------------------------------
  //State Changer
  void onChangeDetailSuratState(DetailSuratState val) {
    detailSuratState.value = val;
  }

  void onChangeDetailTafisrState(DetailTarifState val) {
    detailTarifState.value = val;
  }

  void onShowModalTafsir(bool val) {
    showModalTafsir.value = val;
  }

  //------------------------------------------------------------------------------------------------
  //AUDIO PLAYER

  void handlePlaying(AudioPlayer player) {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void handleSeek(double value, AudioPlayer player) {
    player.seek(Duration(seconds: value.toInt()));
    player.play();
  }

  void setInitiPlayer(AudioPlayer player, String url) {
    player.setUrl(url);
  }

  void setPositionStream(Duration _position) {
    position.value = _position;
  }

  void setDurationStream(Duration _duration) {
    duration.value = _duration;

    setDurationPerAyat();
  }

  void setDurationPerAyat() {
    if (duration.value.inSeconds == 0) return;

    var durationPerSecondHolder =
        duration.value.inSeconds / detailSuratInfo!.value.ayat.length;
    durationPerAyat.value = durationPerSecondHolder;
  }

  //------------------------------------------------------------------------------------------------
  //TAFSIR

  void onSetCurrentTafsir(TafsirInfo tafsir) {
    tafsirTitle.value = detailTarifnfo!.value.namaLatin;
    tafsirText.value = tafsir.tafsir;
  }

  //------------------------------------------------------------------------------------------------

  Future doGetDataDetailSurat(String id) async {
    onChangeDetailSuratState(DetailSuratState.loading);

    final result = await getDataDetailSurat(id);
    result.fold((l) {
      // ignore: unused_local_variable
      var error = Rx(l).toJson().toString();

      onChangeDetailSuratState(DetailSuratState.error);
      onSentNotifSnackBar(navigator!.context, 'Fail Get Detail Surat ${error}');
    }, (r) {
      var data = Rx(r);
      detailSuratInfo = data;

      onChangeDetailSuratState(DetailSuratState.getData);
    });
  }

  Future doGetDataDetailTafsir(String id) async {
    onChangeDetailTafisrState(DetailTarifState.loading);

    final result = await getDataDetailTafsir(id);
    result.fold((l) {
      // ignore: unused_local_variable
      var error = Rx(l).toJson().toString();

      onChangeDetailTafisrState(DetailTarifState.error);
      onSentNotifSnackBar(
          navigator!.context, 'Fail Get Detail Tafisr ${error}');
    }, (r) {
      var data = Rx(r);
      detailTarifnfo = data;

      onChangeDetailTafisrState(DetailTarifState.getData);
    });
  }
}
