import 'package:animate_gradient/animate_gradient.dart';
import 'package:e_quran/core/utils/color/color_utils.dart';
import 'package:e_quran/features/surat/presentation/view/surat.view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardWidget(Size size, String suratId, String title, String arabicText,
    String arti, String tempat, int jumlahAyat, int index,
    {bool disbaledIndex = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: const [primaryColor, secondaryColor],
        secondaryColors: const [thirdColor, fourthColor],
        child: Container(
          width: size.width,
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () => Get.to(SuratView(id: suratId)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' - ',
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: arabicText,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: arti,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' - ',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: '$jumlahAyat ayat',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' - ',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: tempat,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: !disbaledIndex
                      ? Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                              color: black.withOpacity(0)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              index.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
