import 'package:animate_gradient/animate_gradient.dart';
import 'package:e_quran/core/resources/injector/injector_container.dart';
import 'package:e_quran/core/utils/color/color_utils.dart';
import 'package:e_quran/features/surat/presentation/controller/surat.controller.dart';
import 'package:e_quran/features/surat/presentation/view/widgets/ayat_detail.widget.dart';
import 'package:e_quran/features/surat/presentation/view/widgets/modal_tafsir.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class SuratView extends StatefulWidget {
  final String id;
  const SuratView({super.key, required this.id});

  @override
  State<SuratView> createState() => _SuratViewState();
}

class _SuratViewState extends State<SuratView> with TickerProviderStateMixin {
  final Shader textGradient = const LinearGradient(
    colors: <Color>[primaryColor, secondaryColor],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  SuratController suratController = sl.get<SuratController>();
  final player = AudioPlayer();

  @override
  initState() {
    super.initState();
    //----------------------------------------------------------------
    suratController.initializedAllData(widget.id, player);

    player.positionStream.listen((p) {
      suratController.setPositionStream(p);
    });

    player.durationStream.listen((d) {
      suratController.setDurationStream(d!);
    });

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          suratController.position.value = Duration.zero;
        });

        player.pause();
        player.seek(suratController.position.value);
      }
    });
  }

  @override
  void dispose() {
    if (mounted) {
      disposePlayer();
    }
    super.dispose();
  }

  void disposePlayer() {
    if (mounted) {
      player.pause();
      player.seek(Duration.zero);
      player.dispose();

      //CLOSE MODAL TAFSIR
      suratController.onShowModalTafsir(false);
    }
  }

  void onBackPressed() {
    disposePlayer();
    Future.microtask(() => Navigator.pop(context));
  }

  Future<bool> onWillPop() async {
    disposePlayer();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => suratController.detailSuratState.value ==
            DetailSuratState.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : WillPopScope(
            onWillPop: onWillPop,
            child: Stack(
              children: [
                //================================================================================================================================
                //MAIN CONTENT
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: black,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        onBackPressed();
                      },
                    ),
                    title: Container(
                      alignment: Alignment.centerLeft,
                      width: size.width,
                      child: Text('EQuran.id',
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              foreground: Paint()..shader = textGradient,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  body: Container(
                    height: size.height,
                    width: size.width,
                    color: darkGrey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: black),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AnimateGradient(
                              primaryBegin: Alignment.topLeft,
                              primaryEnd: Alignment.bottomLeft,
                              secondaryBegin: Alignment.bottomLeft,
                              secondaryEnd: Alignment.topRight,
                              primaryColors: const [
                                primaryColor,
                                secondaryColor
                              ],
                              secondaryColors: const [thirdColor, fourthColor],
                              child: Container(
                                width: size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: suratController
                                                    .detailSuratInfo!
                                                    .value
                                                    .namaLatin,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: ' - ',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: suratController
                                                    .detailSuratInfo!
                                                    .value
                                                    .nama,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: suratController
                                                    .detailSuratInfo!
                                                    .value
                                                    .arti,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              TextSpan(
                                                text: ' - ',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${suratController.detailSuratInfo!.value.jumlahAyat} ayat',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              TextSpan(
                                                text: ' - ',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              TextSpan(
                                                text: suratController
                                                    .detailSuratInfo!
                                                    .value
                                                    .tempatTurun,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width: size.width * .75,
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              activeTrackColor: black,
                                              inactiveTrackColor: Colors.white,
                                              thumbColor: Colors.white,
                                              overlayColor:
                                                  Colors.white.withOpacity(0.2),
                                              thumbShape:
                                                  const RoundSliderThumbShape(
                                                      enabledThumbRadius: 8.0),
                                              trackHeight: 4.0,
                                            ),
                                            child: Slider(
                                              min: 0.0,
                                              max: suratController
                                                  .duration.value.inSeconds
                                                  .toDouble(),
                                              value: suratController
                                                  .position.value.inSeconds
                                                  .toDouble(),
                                              onChanged: (e) => suratController
                                                  .handleSeek(e, player),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: darkGrey),
                                          child: InkWell(
                                            onTap: () {
                                              suratController
                                                  .handlePlaying(player);
                                            },
                                            child: Icon(
                                              player.playing
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //QARI READER
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Qari',
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: darkGrey,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Misyari-Rasyid-Al-Afasi',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: softenDarkGrey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //----------------------------------------------------------------
                          //CONTENT
                          Expanded(
                              child: ListView(
                            children: suratController
                                    .detailSuratInfo!.value.ayat.isNotEmpty
                                ? suratController.detailSuratInfo!.value.ayat
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                    int index = entry.key + 1;
                                    var ayat = entry.value;
                                    return ayatDetailCard(
                                        size,
                                        ayat.surah,
                                        ayat.nomor,
                                        ayat.ar,
                                        ayat.tr,
                                        ayat.idn, () {
                                      suratController.handleSeek(
                                          (index *
                                              suratController
                                                  .durationPerAyat.value),
                                          player);
                                    }, () {
                                      suratController.onSetCurrentTafsir(
                                          suratController.detailTarifnfo!.value
                                              .tafsir[entry.key]);
                                      suratController.onShowModalTafsir(true);
                                    });
                                  }).toList()
                                : [],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),

                //================================================================================================================================
                //MODAL TAFSIR
                suratController.showModalTafsir.value
                    ? modalTafsir(size, () {
                        suratController.showModalTafsir(false);
                      }, suratController.tafsirTitle.value,
                        suratController.tafsirText.value)
                    : const SizedBox()
              ],
            ),
          ));
  }
}
