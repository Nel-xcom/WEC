import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class SuccessfulVerificationScreen extends StatefulWidget {
  const SuccessfulVerificationScreen({super.key});

  @override
  State<SuccessfulVerificationScreen> createState() => _SuccessfulVerificationScreenState();
}

class _SuccessfulVerificationScreenState extends State<SuccessfulVerificationScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
                
                // Icono de verificación exitosa
                Image.asset(
                  '/images/icons/check-mark.png',
                  width: ResponsiveHelper.getScaledWidth(context, 100),
                  height: ResponsiveHelper.getScaledHeight(context, 100),
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.check_circle,
                      size: ResponsiveHelper.getScaledFontSize(context, 100),
                      color: const Color(0xFFD5F1FF),
                    );
                  },
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 16),
                
                // Título
                Text(
                  'Verificación exitosa',
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
                  'Ingresa tu nueva contraseña',
                  style: GoogleFonts.openSans(
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 32),
                
                // Campo de contraseña
                _buildPasswordField(
                  label: 'Contraseña',
                  hint: 'Ingresa tu nueva contraseña',
                  obscureText: _obscurePassword,
                  onToggle: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 16),
                
                // Campo de confirmar contraseña
                _buildPasswordField(
                  label: 'Repite tu contraseña',
                  hint: 'Confirma tu nueva contraseña',
                  obscureText: _obscureConfirmPassword,
                  onToggle: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 32),
                
                // Botón "Confirmar"
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
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Center(
                        child: Text(
                          'Confirmar',
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

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required bool obscureText,
    required VoidCallback onToggle,
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
            obscureText: obscureText,
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
                Icons.lock,
                color: Colors.white.withOpacity(0.7),
                size: ResponsiveHelper.getScaledFontSize(context, 20),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white.withOpacity(0.7),
                  size: ResponsiveHelper.getScaledFontSize(context, 20),
                ),
                onPressed: onToggle,
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
