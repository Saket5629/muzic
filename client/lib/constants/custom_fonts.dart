part of 'theme_constants.dart';

class CustomFonts {
  const CustomFonts._();

  static TextStyle helveticaNeue({
    TextStyle? textStyle,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeConstants.textColor,
      fontSize: fontSize ?? 14,
      fontFamily: "HelveticaNeue",
    );
  }

  static TextStyle arialRoundedMTBold({
    TextStyle? textStyle,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? ThemeConstants.textColor,
      fontSize: fontSize ?? 14,
      fontFamily: "ArialRoundedMTBold",
    );
  }
}