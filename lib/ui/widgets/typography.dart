import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textSemiBold(String text, Color color, {TextAlign? align}) {
  return Text(text,
      textAlign: align,
      style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          decoration: TextDecoration.none,
          color: color
      ));
}

Widget textMiniTextRegular(String text, Color color, {TextAlign? align}) {
  return Text(text,
      textAlign: align,
      style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          decoration: TextDecoration.none,
          color: color
      ));
}

Widget textMiniMiniMedium(String text, Color color, {TextAlign? align}) {
  return Text(text,
      textAlign: align,
      style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          decoration: TextDecoration.none,
          color: color
      ));
}

Widget textSmall(String text, Color color, {TextAlign? align}) {
  return Text(text,
      textAlign: align,
      style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w400,
          fontSize: 11,
          decoration: TextDecoration.none,
          color: color
      ));
}

Widget textHeading3(String text, Color color, {TextAlign? align}) {
  return Text(text,
      textAlign: align,
      style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          decoration: TextDecoration.none,
          color: color
      ));
}

Widget textHeading4(String text, Color color, {TextAlign? align}) {
  return Text(text,
      textAlign: align,
      style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          decoration: TextDecoration.none,
          color: color
      ));
}
