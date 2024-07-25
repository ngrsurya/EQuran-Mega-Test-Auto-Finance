import 'package:e_quran/core/utils/color/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ayatDetailCard(
  Size size,
  int surah,
  int nomor,
  String ar,
  String tr,
  String idn,
  dynamic func,
  dynamic showModalTafsir,
  bool isActive,
) {
  return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border: isActive ? Border.all(width: 1, color: primaryColor) : null,
          borderRadius: BorderRadius.circular(15),
          color: darkGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$surah:$nomor',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: softenDarkGrey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: size.width * .5,
                child: Text(
                  ar,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),

          //ARABIC
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tr,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    idn,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: thirdColor),
                      child: InkWell(
                        // onTap: () {
                        //   // handlePlaying();
                        //   // handleSeek(7);
                        // },
                        onTap: func,
                        child: const Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: showModalTafsir,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: black),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.saved_search,
                                color: Colors.white,
                              ),
                              Text(
                                "Tafsir",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ));
}
