import 'package:flutter/material.dart';

class CustomTextStyles {
  CustomTextStyles._internal();

  static final CustomTextStyles instance = CustomTextStyles._internal();

  factory CustomTextStyles() => instance;

  TextStyle xSmText(
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.grey,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 12);
  }

  TextStyle smText(
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.grey,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 14);
  }

  TextStyle normalText(
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.grey,
      FontStyle? fontStyle}) {
    return TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: 16,
        fontStyle: fontStyle);
  }

  TextStyle lgText(
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.grey,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 18);
  }

  TextStyle xLgText(
      {FontWeight fontWeight = FontWeight.normal, Color color = Colors.grey}) {
    return TextStyle(fontWeight: fontWeight, color: color, fontSize: 20);
  }

  TextStyle xxLgText(
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.grey,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 22);
  }

  TextStyle smTextSemiBold(
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.black,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 14);
  }

  TextStyle xxLgBoldText(
      {FontWeight fontWeight = FontWeight.bold,
      Color color = Colors.black,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 24);
  }

  TextStyle labelTextStyle(
      {FontWeight fontWeight = FontWeight.bold,
      Color color = Colors.white,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 24);
  }

  TextStyle heading(
      {FontWeight fontWeight = FontWeight.normal, Color color = Colors.grey}) {
    return TextStyle(fontWeight: fontWeight, color: color, fontSize: 30);
  }

  TextStyle customSizeText(
      {FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.grey,
      double? fontSize}) {
    return TextStyle(
        fontWeight: fontWeight, color: color, fontSize: fontSize ?? 16);
  }

  // static TextStyle get f14w600TextStyle =>
  //     TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp);

  // static TextStyle get f14w700TextStyle =>
  //     TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp);

  // static TextStyle get f14w400TextStyle =>
  //     TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp);

  // static TextStyle get f14w500TextStyle =>
  //     TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp);

  // static TextStyle get f12w500hTextStyle =>
  //     TextStyle(fontSize: 12.sp, height: 20 / 12, fontWeight: FontWeight.w500);

  // static TextStyle get f12w500TextStyle =>
  //     TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500);

  // static TextStyle get f12w600TextStyle =>
  //     TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600);

  // static TextStyle get f12w800TextStyle =>
  //     TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800);

  // static TextStyle get f12w300GreyTextStyle => TextStyle(
  //     fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w300);

  // static TextStyle get f12w400GreyTextStyle => TextStyle(
  //     fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w400);
  // static TextStyle get f12w500GreyTextStyle => TextStyle(
  //     fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w500);

  // static TextStyle get f12w300hGreyTextStyle => TextStyle(
  //     fontSize: 12.sp,
  //     color: Colors.grey,
  //     height: 21 / 11,
  //     fontWeight: FontWeight.w300);

  // static TextStyle get f10w400hTextStyle =>
  //     TextStyle(fontSize: 10.sp, height: 20 / 9);

  // static TextStyle get f10w600TextStyle =>
  //     TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600);

  // static TextStyle get f10w500TextStyle =>
  //     TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500);

  // static TextStyle get f11w500hTextStyle =>
  //     TextStyle(fontSize: 11.sp, height: 21 / 11, fontWeight: FontWeight.w500);

  // static TextStyle get f12w400TextStyle => TextStyle(fontSize: 12.sp);

  // static TextStyle get f10w400hGreyTextStyle => TextStyle(
  //       height: 30 / 20,
  //       color: CustomColors.grey6e,
  //       // color: Colors.grey,
  //       fontSize: 10.sp,
  //     );

  // static TextStyle get f10w400GreyTextStyle => TextStyle(
  //       // color: Colors.grey,
  //       color: CustomColors.grey6e,
  //       fontSize: 10.sp,
  //     );

  // static TextStyle get f8w400GreyTextStyle =>
  //     TextStyle(color: Colors.grey, fontSize: 8.sp);

  // static TextStyle get f24w600hTextStyle =>
  //     TextStyle(fontSize: 24.sp, height: 30 / 20, fontWeight: FontWeight.bold);

  // static TextStyle get f20w600hTextStyle =>
  //     TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);

  // static TextStyle get f17w600TextStyle =>
  //     TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold);

  // static TextStyle get f26w600hTextStyle =>
  //     TextStyle(fontSize: 26.sp, height: 30 / 20, fontWeight: FontWeight.bold);

  // static TextStyle get f30w500TextStyle =>
  //     TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500);

  // static TextStyle get f30w600TextStyle =>
  //     TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600);

  // static TextStyle get f32w700hTextStyle =>
  //     TextStyle(fontSize: 32.sp, height: 30 / 20, fontWeight: FontWeight.w700);

  // static TextStyle get f36w700hTextStyle =>
  //     TextStyle(fontSize: 36.sp, height: 30 / 20, fontWeight: FontWeight.w700);

  // static TextStyle get f12w400hTextStyle => TextStyle(
  //     fontSize: 12.sp, fontWeight: FontWeight.normal, height: 30 / 12);

  // static TextStyle get f16w600hTextStyle =>
  //     TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, height: 20 / 12);

  // static TextStyle get f16w400TextStyle => TextStyle(
  //       fontWeight: FontWeight.normal,
  //       fontSize: 16.sp,
  //     );

  // static TextStyle get f16w500TextStyle => TextStyle(
  //       fontWeight: FontWeight.w500,
  //       fontSize: 16.sp,
  //     );

  // static TextStyle get f16w600TextStyle => TextStyle(
  //       fontWeight: FontWeight.bold,
  //       fontSize: 16.sp,
  //     );

  // static TextStyle get f16w800TextStyle => TextStyle(
  //       fontWeight: FontWeight.w800,
  //       fontSize: 16.sp,
  //     );

  // static TextStyle get f15w600TextStyle => TextStyle(
  //       fontWeight: FontWeight.bold,
  //       fontSize: 15.sp,
  //     );

  // static TextStyle get f13w600TextStyle =>
  //     TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600);

  // static TextStyle get f13w500TextStyle =>
  //     TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500);

  // static TextStyle get f13w400TextStyle =>
  //     TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400);

  // static TextStyle get f13wh600TextStyle =>
  //     TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, height: 20 / 12);

  // static TextStyle get f11w400TextStyle =>
  //     TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp);

  // static TextStyle get f11w500TextStyle =>
  //     TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp);

  // static TextStyle get f11w600TextStyle =>
  //     TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp);

  // static TextStyle get f18w500TextStyle =>
  //     TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500);

  // static TextStyle get f18w600TextStyle =>
  //     TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);

  // static TextStyle get f20w600TextStyle =>
  //     TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600);

  // static TextStyle get f20w500TextStyle =>
  //     TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500);

  /*abbreviations
  * fontSize = f
  * fontWeight = w
  * has lineHeight = h as true boolean
  * */
}
