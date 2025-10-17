import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Escalado basado en el ancho de pantalla (referencia: 375px para iPhone X)
  static double getScaledWidth(BuildContext context, double value) {
    final screenWidth = getScreenWidth(context);
    return (screenWidth / 375) * value;
  }

  // Escalado basado en la altura de pantalla (referencia: 812px para iPhone X)
  static double getScaledHeight(BuildContext context, double value) {
    final screenHeight = getScreenHeight(context);
    return (screenHeight / 812) * value;
  }

  // Escalado de fuente basado en el ancho de pantalla
  static double getScaledFontSize(BuildContext context, double fontSize) {
    final screenWidth = getScreenWidth(context);
    return (screenWidth / 375) * fontSize;
  }

  // Breakpoints para diferentes tamaños de pantalla
  static bool isSmallScreen(BuildContext context) {
    return getScreenWidth(context) < 360;
  }

  static bool isMediumScreen(BuildContext context) {
    final width = getScreenWidth(context);
    return width >= 360 && width < 414;
  }

  static bool isLargeScreen(BuildContext context) {
    return getScreenWidth(context) >= 414;
  }

  // Padding responsivo
  static EdgeInsets getResponsivePadding(BuildContext context, {
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsets.only(
      top: top != null ? getScaledHeight(context, top) : (vertical ?? all ?? 0),
      bottom: bottom != null ? getScaledHeight(context, bottom) : (vertical ?? all ?? 0),
      left: left != null ? getScaledWidth(context, left) : (horizontal ?? all ?? 0),
      right: right != null ? getScaledWidth(context, right) : (horizontal ?? all ?? 0),
    );
  }

  // SizedBox responsivo
  static SizedBox getResponsiveSizedBox(BuildContext context, {
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width != null ? getScaledWidth(context, width) : null,
      height: height != null ? getScaledHeight(context, height) : null,
    );
  }

  // BorderRadius responsivo
  static BorderRadius getResponsiveBorderRadius(BuildContext context, double radius) {
    return BorderRadius.circular(getScaledWidth(context, radius));
  }
}
