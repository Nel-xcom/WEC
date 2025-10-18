import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class LocationScreen extends StatefulWidget {
  final String? selectedProfile;
  final String? selectedLanguage;
  final List<String>? selectedIndustries;

  const LocationScreen({
    Key? key,
    this.selectedProfile,
    this.selectedLanguage,
    this.selectedIndustries,
  }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
              children: [
                // Logo WEC con gradiente diagonal - MÁS ARRIBA
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, top: 85),
                  child: Column(
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
                ),
                
                // Espaciador para centrar el contenido
                const Spacer(),
                
                // Contenido principal centrado
                Transform.translate(
                  offset: Offset(0, -50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    // Ícono de ubicación - MÁS PEQUEÑO
                    Image.asset(
                      '/WEC/assets/images/icons/location.png',
                      width: ResponsiveHelper.getScaledWidth(context, 60),
                      height: ResponsiveHelper.getScaledHeight(context, 60),
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.location_on,
                          size: ResponsiveHelper.getScaledFontSize(context, 60),
                          color: const Color(0xFFFFBFF6),
                        );
                      },
                    ),
                    
                    ResponsiveHelper.getResponsiveSizedBox(context, height: 20),
                    
                    // Título
                    Text(
                      'Comparte tu ubicación',
                      style: GoogleFonts.openSans(
                        fontSize: ResponsiveHelper.getScaledFontSize(context, 24),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD5F1FF),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    ResponsiveHelper.getResponsiveSizedBox(context, height: 12),
                    
                    // Texto explicativo
                    Padding(
                      padding: ResponsiveHelper.getResponsivePadding(
                        context,
                        horizontal: 40,
                      ),
                      child: Text(
                        'Necesitamos tu ubicación para conectarte con emprendedores, vendedores e inversores del mundo. Esto nos ayuda a personalizar tu experiencia desde el inicio.',
                        style: GoogleFonts.openSans(
                          fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFD5F1FF),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    ResponsiveHelper.getResponsiveSizedBox(context, height: 30),
                    
                    // Botón Aceptar - MÁS PEQUEÑO
                    Container(
                      width: ResponsiveHelper.getScaledWidth(context, 280),
                      height: ResponsiveHelper.getScaledHeight(context, 48),
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
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            // TODO: Implementar lógica de ubicación
                            Navigator.pushNamed(context, '/marketplace');
                          },
                          child: Center(
                            child: Text(
                              'Aceptar',
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
                  ],
                ),
                ),
                
                // Espaciador para centrar el contenido
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
