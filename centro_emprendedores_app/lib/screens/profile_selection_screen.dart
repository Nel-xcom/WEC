import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});

  @override
  State<ProfileSelectionScreen> createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  String? selectedProfile;

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
                const Spacer(flex: 1),
                
                // Logo WEC con gradiente diagonal - COPIADO EXACTAMENTE de welcome_screen
                Transform.translate(
                  offset: const Offset(0, -20),
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
                    // Subtítulo "world entrepreneur center" - COPIADO EXACTAMENTE de welcome_screen
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
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 50),
                
                // Título principal
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 10.0),
                  child: Text(
                    '¿Con qué perfil te identificás?',
                    style: GoogleFonts.openSans(
                      fontSize: ResponsiveHelper.getScaledFontSize(context, 20.0),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFD5F1FF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 30),
                
                // Contenedores de perfiles
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProfileCard(
                        iconPath: '/images/icons/businessman-with-tie.png',
                        label: 'Emprendedor',
                        profileType: 'emprendedor',
                      ),
                      _buildProfileCard(
                        iconPath: '/images/icons/briefcase.png',
                        label: 'Vendedor',
                        profileType: 'vendedor',
                      ),
                      _buildProfileCard(
                        iconPath: '/images/icons/investor.png',
                        label: 'Inversor',
                        profileType: 'inversor',
                      ),
                    ],
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 30),
                
                // Texto descriptivo
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 20.0),
                  child: Text(
                    'Esto nos ayuda a personalizar tu experiencia desde el inicio.',
                    style: GoogleFonts.openSans(
                      fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                      color: const Color(0xFFD5F1FF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String iconPath,
    required String label,
    required String profileType,
  }) {
    final isSelected = selectedProfile == profileType;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedProfile = profileType;
        });
        Navigator.pushNamed(
          context, 
          '/language-selection',
          arguments: {'selectedProfile': profileType},
        );
      },
      child: Column(
        children: [
          Container(
            width: ResponsiveHelper.getScaledWidth(context, 85),
            height: ResponsiveHelper.getScaledHeight(context, 85),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9).withOpacity(0.44),
              border: Border.all(
                color: const Color(0xFFFFBFF6),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: ResponsiveHelper.getScaledWidth(context, 32),
                height: ResponsiveHelper.getScaledHeight(context, 32),
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.person,
                    size: ResponsiveHelper.getScaledFontSize(context, 32),
                    color: const Color(0xFFFFBFF6),
                  );
                },
              ),
            ),
          ),
          ResponsiveHelper.getResponsiveSizedBox(context, height: 8),
          Text(
            label,
            style: GoogleFonts.openSans(
              fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
              fontWeight: FontWeight.bold,
              color: const Color(0xFFD5F1FF),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
