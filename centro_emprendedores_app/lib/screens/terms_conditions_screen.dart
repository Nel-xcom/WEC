import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD5F1FF), // 0%
              Color(0xFFFFBFF6), // 28%
            ],
            stops: [0.0, 0.28],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              
              // LOGO Y SUBTÍTULO - CENTRADO entre margen top y contenedor
              Padding(
                padding: ResponsiveHelper.getResponsivePadding(context, top: 25), // 10 + 15 = 25
                child: Column(
                  children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF000000), // 0%
                    Color(0xFF141414), // 50%
                    Color(0xFF4D4D4D), // 100%
                  ],
                  stops: [0.0, 0.5, 1.0],
                ).createShader(bounds),
                child: Text(
                  'WEC',
                  style: TextStyle(
                    fontFamily: 'NicoMoji',
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 100), // 85 + 15 = 100
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: 0,
                    height: 0.8,
                  ),
                ),
              ),
              
              ResponsiveHelper.getResponsiveSizedBox(context, height: 5),
              
              Text(
                'world entrepreneur center',
                style: TextStyle(
                  fontFamily: 'NicoMoji',
                  fontSize: ResponsiveHelper.getScaledFontSize(context, 9.5), // 8.5 + 1 = 9.5
                  fontWeight: FontWeight.bold, // Bold
                  color: const Color(0xFF0F0F0F),
                  letterSpacing: 1.2,
                  height: 0.8,
                ),
              ),
                ],
                ),
              ),
              
              const Spacer(flex: 1),
              
              // CONTENEDOR #0F0F0F - OCUPA POCO MÁS DE LA MITAD
              Container(
                width: double.infinity,
                height: ResponsiveHelper.getScreenHeight(context) * 0.65, // 65% de la pantalla (poco más de la mitad)
                padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 16, vertical: 24), // Menos padding horizontal para más ancho
                decoration: BoxDecoration(
                  color: const Color(0xFF0F0F0F),
                  borderRadius: BorderRadius.only(
                    topLeft: ResponsiveHelper.getResponsiveBorderRadius(context, 20).topLeft,
                    topRight: ResponsiveHelper.getResponsiveBorderRadius(context, 20).topRight,
                  ),
                ),
                child: Column(
                  children: [
                    ResponsiveHelper.getResponsiveSizedBox(context, height: 20),
                
                // Título
                Text(
                  'Términos y condiciones',
                  style: GoogleFonts.openSans(
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 24),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFD5F1FF),
                    fontStyle: FontStyle.normal, // Ya es bold, confirmo
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 16),
                
                // Texto explicativo
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 30),
                  child: Text(
                    'Al hacer clic en Aceptar, acepta los términos de uso de World Entrepreneur Center y ha leído y comprendido su política de privacidad.',
                    style: GoogleFonts.openSans(
                      fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                      color: Colors.white.withOpacity(0.7),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 16),
                
                // Enlace "Términos y condiciones"
                GestureDetector(
                  onTap: () {
                    // Aquí se puede abrir un modal o navegar a una pantalla con los términos completos
                  },
                  child: Text(
                    'Términos y condiciones',
                    style: GoogleFonts.openSans(
                      fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                      color: const Color(0xFFD9ECFE),
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFFD9ECFE),
                      fontStyle: FontStyle.italic, // Agregado cursiva
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 32),
                
                // Botón "Aceptar y continuar" - CENTRADO
                Center(
                  child: Container(
                  width: ResponsiveHelper.getScaledWidth(context, 280), // Width más pequeño
                  height: ResponsiveHelper.getScaledHeight(context, 56),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD5F1FF), // Color sólido, no gradiente
                    borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 28), // Más redondeado
                    border: Border.all(
                      color: Colors.white.withOpacity(0.7),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 28),
                      onTap: () {
                        Navigator.pushNamed(context, '/profile-selection');
                      },
                      child: Center(
                        child: Text(
                          'Aceptar y continuar',
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
                ),
                
                    ResponsiveHelper.getResponsiveSizedBox(context, height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
