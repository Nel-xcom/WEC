import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String contactInfo;
  final String contactType;

  const VerificationCodeScreen({
    super.key,
    required this.contactInfo,
    required this.contactType,
  });

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
                  'Ingresa el código de verificación',
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
                  'Escribe el código que enviamos a ${widget.contactInfo}',
                  style: GoogleFonts.openSans(
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 32),
                
                // Campos de código
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: ResponsiveHelper.getScaledWidth(context, 60),
                      height: ResponsiveHelper.getScaledHeight(context, 60),
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: GoogleFonts.openSans(
                          fontSize: ResponsiveHelper.getScaledFontSize(context, 24),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: const Color(0xFF2E2E2E).withOpacity(0.38),
                          border: OutlineInputBorder(
                            borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 12),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.7),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 12),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.7),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 12),
                            borderSide: BorderSide(
                              color: const Color(0xFFD5F1FF),
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            if (index < 3) {
                              _focusNodes[index + 1].requestFocus();
                            } else {
                              _focusNodes[index].unfocus();
                            }
                          }
                        },
                      ),
                    );
                  }),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 32),
                
                // Botón "Aceptar"
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
                        Navigator.pushNamed(context, '/successful-verification');
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
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 24),
                
                // Pregunta
                Text(
                  '¿No recibiste el código de verificación?',
                  style: GoogleFonts.openSans(
                    fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 8),
                
                // Botón "Enviar código por SMS"
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot-password-sms');
                  },
                  child: Text(
                    'Enviar código por SMS',
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
}
