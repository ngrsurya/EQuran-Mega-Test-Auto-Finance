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

  //AUDIO
  RxList<String> audioReader = [
    'Abdullah Al Juhany',
    'Abdul Muhsin Al Qasim',
    'Abdurrahman as Sudais',
    'Ibrahim Al Dossari',
    'Misyari Rasyid Al Afasi'
  ].obs;

  RxList audioUrl = [].obs;
  RxList ayatDurationList = [].obs;

  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> duration = Duration.zero.obs;
  Rx<double> durationPerAyat = 0.0.obs;

  Rx<int> currentIndexAudio = 0.obs;

  //TAFSIR
  Rx<String> tafsirTitle = ''.obs;
  Rx<String> tafsirText = ''.obs;

  SuratController(
      {required this.getDataDetailSurat, required this.getDataDetailTafsir});

  Future<void> initializedAllData(String suratID, AudioPlayer player) async {
    await doGetDataDetailSurat(suratID);
    await doGetDataDetailTafsir(suratID);

    if (detailSuratInfo != null) {
      setInitiPlayer(player, detailSuratInfo!.value.audioFull.no5);
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

  //================================================================--------------------------------
  void resetAll() {
    tafsirTitle.value = '';
    tafsirText.value = '';

    durationPerAyat.value = 0.0;
    currentIndexAudio.value = 0;
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

  void setPositionStream(Duration positionHolder) {
    position.value = positionHolder;
  }

  void setDurationStream(Duration durationHolder) {
    duration.value = durationHolder;

    // ignore: unrelated_type_equality_checks
    if (durationHolder != 0) {
      onChangeDetailSuratState(DetailSuratState.loading);
      setDurationAudio();
    }

    // setDurationPerAyat();
  }

  // void setDurationPerAyat() {
  //   if (duration.value.inSeconds == 0) return;

  //   var durationPerSecondHolder =
  //       duration.value.inSeconds / detailSuratInfo!.value.ayat.length;
  //   durationPerAyat.value = durationPerSecondHolder;
  // }

  Future<void> setDurationAudio() async {
    if (detailSuratInfo == null) return;

    var audioHolder = [];

    audioHolder.add(detailSuratInfo!.value.audioFull.no1);
    audioHolder.add(detailSuratInfo!.value.audioFull.no2);
    audioHolder.add(detailSuratInfo!.value.audioFull.no3);
    audioHolder.add(detailSuratInfo!.value.audioFull.no4);
    audioHolder.add(detailSuratInfo!.value.audioFull.no5);
    audioUrl.value = audioHolder;

    //SET DURATION PER SURAT
    var indexStartSeconds = 0.0;

    final player = AudioPlayer();
    var ayatDurationListHolder = [0.0];

    for (var j = 0; j < detailSuratInfo!.value.ayat.length; j++) {
      var ayatAudio = detailSuratInfo!.value.ayat[j].audio.no5;
      var audioHolder = await player.setUrl(ayatAudio);
      var durationInSeconds = audioHolder!.inSeconds.toDouble();

      var durationAudioHolder = indexStartSeconds + durationInSeconds;

      // Adjust the duration for the first segment
      if (j == 0) {
        durationAudioHolder += 5; // Add 5 seconds for the first segment
      }
      indexStartSeconds = durationAudioHolder;

      ayatDurationListHolder
          .add(durationAudioHolder + 1.0); //Adjustment 1 second to every ayat

      // CHECK IF DATA LOADED ALMOST 30%
      final threshold = (detailSuratInfo!.value.ayat.length * 0.3).round();
      if (j == threshold - 1) {
        onChangeDetailSuratState(DetailSuratState.getData);
      }
    }

    ayatDurationList.value = ayatDurationListHolder;
    player.dispose();
  }

  int findIndexForCurrentDuration(double currentSecond) {
    // ignore: invalid_use_of_protected_member
    for (int i = 0; i < ayatDurationList.value.length - 1; i++) {
      // ignore: invalid_use_of_protected_member
      if (currentSecond >= ayatDurationList.value[i] &&
          // ignore: invalid_use_of_protected_member
          currentSecond < ayatDurationList.value[i + 1]) {
        return i;
      }
    }
    // ignore: invalid_use_of_protected_member
    return ayatDurationList.value.length - 1;
  }

  void setCurrentIndexAudiPlayed(int index) {
    currentIndexAudio.value = index;
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
      onSentNotifSnackBar(navigator!.context, 'Fail Get Detail Surat $error');
    }, (r) {
      var data = Rx(r);
      detailSuratInfo = data;

      if (data.value.ayat.isEmpty) {
        onChangeDetailSuratState(DetailSuratState.getData);
      }
    });
  }

  Future doGetDataDetailTafsir(String id) async {
    onChangeDetailTafisrState(DetailTarifState.loading);

    final result = await getDataDetailTafsir(id);
    result.fold((l) {
      // ignore: unused_local_variable
      var error = Rx(l).toJson().toString();

      onChangeDetailTafisrState(DetailTarifState.error);
      onSentNotifSnackBar(navigator!.context, 'Fail Get Detail Tafisr $error');
    }, (r) {
      var data = Rx(r);
      detailTarifnfo = data;

      onChangeDetailTafisrState(DetailTarifState.getData);
    });
  }
}
