// ignore_for_file: public_member_api_docs

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ticketeer/core/constants/string_constants.dart';

/// Global getter used throughout the app to set the style property
/// in Text widget without using material text styles (like header1 and etc.)
CustomTextStyle get roboto => const Roboto();

/// Custom text style extension specifically for roboto family
class Roboto extends CustomTextStyle {
  const Roboto()
      : super._(
          fontFamily: robotoFontName,
          fontSize: 14.0,
        );
}

// Custom TextStyle
class CustomTextStyle extends TextStyle {
  const CustomTextStyle._({
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextLeadingDistribution? leadingDistribution,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
  }) : super(
          inherit: inherit,
          color: color,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          leadingDistribution: leadingDistribution,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows,
          fontFeatures: fontFeatures,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          package: package,
        );

  // sizes
  CustomTextStyle get s8 => copyWith(fontSize: 8);

  CustomTextStyle get s9 => copyWith(fontSize: 9);

  CustomTextStyle get s10 => copyWith(fontSize: 10);

  CustomTextStyle get s11 => copyWith(fontSize: 11);

  CustomTextStyle get s12 => copyWith(fontSize: 12);

  CustomTextStyle get s13 => copyWith(fontSize: 13);

  CustomTextStyle get s14 => copyWith(fontSize: 14);

  CustomTextStyle get s15 => copyWith(fontSize: 15);

  CustomTextStyle get s16 => copyWith(fontSize: 16);

  CustomTextStyle get s18 => copyWith(fontSize: 18);

  CustomTextStyle get s20 => copyWith(fontSize: 20);

  CustomTextStyle get s22 => copyWith(fontSize: 22);

  CustomTextStyle get s24 => copyWith(fontSize: 24);

  CustomTextStyle get s26 => copyWith(fontSize: 26);

  CustomTextStyle get s30 => copyWith(fontSize: 30);

  CustomTextStyle get s32 => copyWith(fontSize: 32);

  CustomTextStyle get s36 => copyWith(fontSize: 36);

  CustomTextStyle get s52 => copyWith(fontSize: 52);

  // weights
  CustomTextStyle get w100 => copyWith(fontWeight: FontWeight.w100);

  CustomTextStyle get w300 => copyWith(fontWeight: FontWeight.w300);

  CustomTextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  CustomTextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  CustomTextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  CustomTextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  CustomTextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  // style
  CustomTextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  // heights
  CustomTextStyle get h13 => copyWith(height: 1.35);

  CustomTextStyle get h10 => copyWith(height: 1);

  CustomTextStyle get h15 => copyWith(height: 1.5);

  CustomTextStyle get h35 => copyWith(height: 3.5);

  // shadows
  //CTextStyle get shadow => copyWith(shadows: CShadows.defaultShadow);

  // decoration
  CustomTextStyle get underline =>
      copyWith(decoration: TextDecoration.underline);

  @override
  CustomTextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return CustomTextStyle._(
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null
          ? color ?? this.color
          : null,
      backgroundColor: this.background == null && background == null
          ? backgroundColor ?? this.backgroundColor
          : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }
}
