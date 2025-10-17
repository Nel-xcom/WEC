import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class ForgotPasswordSMSScreen extends StatelessWidget {
  const ForgotPasswordSMSScreen({super.key});

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
              Column(
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
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 85),
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
                  fontSize: ResponsiveHelper.getScaledFontSize(context, 8.5),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0F0F0F),
                  letterSpacing: 1.2,
                  height: 0.8,
                ),
              ),
                ],
              ),
              
              const Spacer(),
              
              // CONTENEDOR #0F0F0F - PEGADO AL BOTTOM
              Container(
                width: double.infinity,
                padding: ResponsiveHelper.getResponsivePadding(context, all: 24),
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
                  '¿Olvidaste tu contraseña?',
                  style: GoogleFonts.openSans(
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 24),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFD5F1FF),
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 8),
                
                // Instrucción
                Text(
                  'Ingresa tu número de teléfono y recibe un código de recuperación',
                  style: GoogleFonts.openSans(
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 32),
                
                // Campo de teléfono
                _buildTextField(
                  label: 'Teléfono',
                  hint: '1234567890',
                  keyboardType: TextInputType.phone,
                  icon: Icons.phone,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 24),
                
                // Botón "Enviar código"
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
                    borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 24),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.7),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 24),
                      onTap: () {
                        Navigator.pushNamed(context, '/verification-code', arguments: {
                          'contactInfo': '541111111111',
                          'contactType': 'telefono',
                        });
                      },
                      child: Center(
                        child: Text(
                          'Enviar código',
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
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 24),
                
                // Separador "o"
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 16),
                      child: Text(
                        'o',
                        style: GoogleFonts.openSans(
                          fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 24),
                
                // Botón "Enviar código por correo"
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                  child: Text(
                    'Enviar código por correo',
                    style: GoogleFonts.openSans(
                      fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFD9ECFE),
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

  Widget _buildTextField({
    required String label,
    required String hint,
    TextInputType? keyboardType,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        ResponsiveHelper.getResponsiveSizedBox(context, height: 8),
        Container(
          height: ResponsiveHelper.getScaledHeight(context, 48),
          decoration: BoxDecoration(
            color: const Color(0xFF2E2E2E).withOpacity(0.38),
            borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 24),
            border: Border.all(
              color: Colors.white.withOpacity(0.7),
              width: 1,
            ),
          ),
          child: TextField(
            keyboardType: keyboardType,
            style: GoogleFonts.openSans(
              fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.openSans(
                fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                color: Colors.white.withOpacity(0.5),
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(0.7),
                size: ResponsiveHelper.getScaledFontSize(context, 20),
              ),
              border: InputBorder.none,
              contentPadding: ResponsiveHelper.getResponsivePadding(
                context,
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
