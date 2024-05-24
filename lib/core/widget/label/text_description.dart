// ignore_for_file: must_be_immutable, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/colors/list_color.dart';
import '../../../res/dimension/constants.dart';
import '../../../res/dimension/global.dart';

class ComponentTextDescription extends StatelessWidget {
  String? textContent;
  TextAlign textAlign;
  Color textColor = Colors.black;
  double fontSize;
  FontWeight? fontWeight;
  int? maxLines;
  bool? isWrappedText;

  ComponentTextDescription(this.textContent,
      {super.key,
      this.textAlign = TextAlign.start,
      this.textColor = Colors.black,
      required this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.maxLines,
      this.isWrappedText});
  @override
  Widget build(BuildContext context) {
    return _textDesc(
        textDesc: textContent.toString(),
        textAlign: textAlign,
        textColorization: textColor);
  }

  Widget _textDesc(
      {String textDesc = "",
      textAlign = TextAlign.center,
      Color textColorization = Colors.black}) {
    return Text(
      "$textDesc",
      style: GoogleFonts.poppins(
          fontSize: fontSize, fontWeight: fontWeight, color: textColorization),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      strutStyle: StrutStyle(forceStrutHeight: isWrappedText),
    );
  }
}

TextStyle notoNashtaliqTextStyle(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? textColor,
    int? maxLines}) {
  return GoogleFonts.notoNastaliqUrdu(
    textStyle: TextStyle(
      color: textColor ?? ConstantColors.commonTextColor,
      fontSize: fontSize ??
          deviceAverageSize * (fontSize ?? ConstantVariables.textSizeRegular),
      decoration: TextDecoration.none,
    ),
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle poppinsTextStyle(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? textColor,
    int? maxLines}) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: textColor ?? ConstantColors.commonTextColor,
      fontSize: fontSize ??
          deviceAverageSize * (fontSize ?? ConstantVariables.textSizeRegular),
      decoration: TextDecoration.none,
    ),
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle notosansArabicTextStyle(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? textColor,
    int? maxLines}) {
  return GoogleFonts.notoSansArabic(
    textStyle: TextStyle(
      color: textColor ?? ConstantColors.commonTextColor,
      fontSize: fontSize ??
          deviceAverageSize * (fontSize ?? ConstantVariables.textSizeRegular),
      decoration: TextDecoration.none,
    ),
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
