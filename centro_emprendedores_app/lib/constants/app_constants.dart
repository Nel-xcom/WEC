import 'package:flutter/material.dart';

class AppColors {
  // Colores principales
  static const Color primaryDark = Color(0xFF0F0F0F);
  static const Color primaryLight = Color(0xFFD5F1FF);
  static const Color primaryPink = Color(0xFFFFBFF6);
  
  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFFD5F1FF), // 31% del gradiente
      Color(0xFFFFBFF6), // 81% del gradiente
    ],
    stops: [0.31, 0.81],
  );
  
  // Colores de texto
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFD5F1FF);
  static const Color textDark = Color(0xFF0F0F0F);
  
  // Transparencias
  static Color white70 = Colors.white.withOpacity(0.7);
  static Color white50 = Colors.white.withOpacity(0.5);
  static Color white30 = Colors.white.withOpacity(0.3);
  static Color white10 = Colors.white.withOpacity(0.1);
}

class AppStyles {
  // Sombras sutiles para botones
  static List<BoxShadow> get subtleShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];
  
  // Sombra para el logo
  static List<BoxShadow> get logoShadow => [
    BoxShadow(
      color: AppColors.primaryLight.withOpacity(0.1),
      blurRadius: 30,
      spreadRadius: 5,
      offset: const Offset(0, 0),
    ),
  ];
  
  // Border radius estándar
  static const double borderRadius = 16.0;
  static const double borderRadiusSmall = 12.0;
  
  // Espaciado
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 40.0;
  
  // Altura de botones
  static const double buttonHeight = 56.0;
}
