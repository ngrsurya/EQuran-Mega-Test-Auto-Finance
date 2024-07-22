import 'package:e_quran/core/resources/injector/injector_container.dart';
import 'package:e_quran/core/utils/color/color_utils.dart';
import 'package:e_quran/features/home/presentation/controller/home.controller.dart';
import 'package:e_quran/features/home/presentation/view/widgets/surat_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader textGradient = const LinearGradient(
      colors: <Color>[primaryColor, secondaryColor],
    ).createShader(
      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
    );

    HomeController homeController = sl.get<HomeController>();
    Size size = MediaQuery.of(context).size;
    return GetBuilder(
        init: homeController,
        builder: (context) {
          return Obx(
            () => Scaffold(
              appBar: AppBar(
                backgroundColor: black,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: homeController.daftarSuratState.value ==
                        DaftarSuratState.loading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //HEADER
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Daftar Surat',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Text(
                                'IT Dev Test Mega Auto Finance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                              child: ListView(
                            children: homeController
                                    .daftarSuratData!.value.data.isNotEmpty
                                ? homeController.daftarSuratData!.value.data
                                    .map((e) => cardWidget(
                                        size,
                                        e.nomor.toString(),
                                        e.nama,
                                        e.namaLatin,
                                        e.arti,
                                        e.tempatTurun,
                                        e.jumlahAyat,
                                        e.nomor))
                                    .toList()
                                : [],
                          ))
                        ],
                      ),
              ),
            ),
          );
        });
  }
}
