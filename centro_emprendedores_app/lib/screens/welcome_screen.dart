import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';
import '../utils/responsive_helper.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF1A1A1A), // Color más claro en el centro
              Color(0xFF0F0F0F), // Color base
              Color(0xFF0A0A0A), // Color más oscuro en los bordes
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                
                // Logo WEC con gradiente diagonal - PEGADO al subtítulo
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFD5F1FF), // Celeste claro
                          Color(0xFFFFBFF6), // Rosado claro
                        ],
                        stops: [0.31, 0.81],
                      ).createShader(bounds),
                      child: Text(
                        'WEC',
                        style: TextStyle(
                          fontFamily: 'NicoMoji',
                          fontSize: ResponsiveHelper.getScaledFontSize(context, 106),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 0,
                          height: 0.8,
                        ),
                      ),
                    ),
                    ResponsiveHelper.getResponsiveSizedBox(context, height: 5),
                    // Subtítulo "world entrepreneur center" - PEGADO al logo
                    Text(
                      'world entrepreneur center',
                      style: GoogleFonts.openSans(
                        fontSize: ResponsiveHelper.getScaledFontSize(context, 15),
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        height: 0.8,
                      ),
                    ),
                  ],
                ),
                
                const Spacer(flex: 1),
                
                // Mensaje de bienvenida
                Text(
                  '¡Comencemos!',
                  style: GoogleFonts.openSans(
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 18),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 22),
                
                // Botón Registrarse
                Container(
                  width: double.infinity,
                  height: ResponsiveHelper.getScaledHeight(context, 56),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFD5F1FF),
                        Color(0xFFFFBFF6),
                      ],
                      stops: [0.31, 0.81],
                    ),
                    borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 28),
                      onTap: () {
                        // Navegar a pantalla de registro
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Center(
                        child: Text(
                          'Regístrate',
                          style: GoogleFonts.openSans(
                            fontSize: ResponsiveHelper.getScaledFontSize(context, 18),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0F0F0F),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 12),
                
                // Botón Iniciar Sesión
                Container(
                  width: double.infinity,
                  height: ResponsiveHelper.getScaledHeight(context, 56),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 28),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.7),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 28),
                      onTap: () {
                        // Navegar a pantalla de login
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Center(
                        child: Text(
                          'Iniciar sesión',
                          style: GoogleFonts.openSans(
                            fontSize: ResponsiveHelper.getScaledFontSize(context, 18),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
