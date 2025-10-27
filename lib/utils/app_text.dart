import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/utils/app_colors.dart';

Widget appText(
  String text, {
  Color? color,
  double? size,
  FontWeight? weight,
  TextAlign? align,
  TextOverflow? overflow,
  int? maxLines,
  double? height,
}) {
  return Text(
    text.tr,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: align ?? TextAlign.start,
    style: GoogleFonts.mulish(
      color: color ?? AppColors.txtWhite,
      height: height,
      fontSize: size ?? 14,
      fontWeight: weight ?? FontWeight.w400,
    ),
  );
}
