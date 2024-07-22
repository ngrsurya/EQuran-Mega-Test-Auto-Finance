import 'package:e_quran/core/utils/color/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget modalTafsir(
    Size size, dynamic closeModal, String title, String content) {
  return Scaffold(
    backgroundColor: black.withOpacity(.8),
    body: Container(
      height: size.height,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: darkGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tafsir - $title',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: closeModal,
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView(
            children: [
              Text(
                content,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ))
        ],
      ),
    ),
  );
}
