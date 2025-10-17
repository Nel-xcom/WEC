import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class IndustrySelectionScreen extends StatefulWidget {
  final String selectedProfile;
  final String selectedLanguage;
  
  const IndustrySelectionScreen({
    super.key,
    required this.selectedProfile,
    required this.selectedLanguage,
  });

  @override
  State<IndustrySelectionScreen> createState() => _IndustrySelectionScreenState();
}

class _IndustrySelectionScreenState extends State<IndustrySelectionScreen> {
  Set<String> selectedIndustries = {};

  final List<Map<String, String>> industries = [
    {'code': 'ai', 'name': 'AI', 'icon': '/images/icons/microchip.png'},
    {'code': 'crypto', 'name': 'Crypto', 'icon': '/images/icons/bitcoin.png'},
    {'code': 'ecommerce', 'name': 'Ecommerce', 'icon': '/images/icons/online-shopping.png'},
    {'code': 'dropshipping', 'name': 'Dropshipping', 'icon': '/images/icons/logistics.png'},
    {'code': 'consultoria', 'name': 'Consultoría', 'icon': '/images/icons/consultation.png'},
    {'code': 'it', 'name': 'IT', 'icon': '/images/icons/information-technology.png'},
    {'code': 'fabricantes', 'name': 'Fabricantes', 'icon': '/images/icons/factory.png'},
    {'code': 'redes_sociales', 'name': 'Redes Sociales', 'icon': '/images/icons/social-media-marketing.png'},
    {'code': 'otros', 'name': 'Otros', 'icon': '/images/icons/application.png'},
  ];

  void _onIndustryTap(String industryCode) {
    setState(() {
      if (selectedIndustries.contains(industryCode)) {
        selectedIndustries.remove(industryCode);
      } else {
        selectedIndustries.add(industryCode);
      }
    });
  }

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
                  offset: const Offset(0, 18),
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
                Transform.translate(
                  offset: const Offset(0, 13),
                  child: Padding(
                    padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 10.0),
                    child: Text(
                      'Selecciona tus industrias preferidas',
                      style: GoogleFonts.openSans(
                        fontSize: ResponsiveHelper.getScaledFontSize(context, 16.0),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD5F1FF),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 30),
                
                // Grid de industrias 3x3
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 20.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: industries.length,
                    itemBuilder: (context, index) {
                      final industry = industries[index];
                      final isSelected = selectedIndustries.contains(industry['code']);
                      
                      return GestureDetector(
                        onTap: () => _onIndustryTap(industry['code']!),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              transform: Matrix4.identity()..scale(isSelected ? 1.05 : 1.0),
                              child: Stack(
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
                                        industry['icon']!,
                                        width: ResponsiveHelper.getScaledWidth(context, 32),
                                        height: ResponsiveHelper.getScaledHeight(context, 32),
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(
                                            Icons.business,
                                            size: ResponsiveHelper.getScaledFontSize(context, 32),
                                            color: const Color(0xFFFFBFF6),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // Indicador de selección con animación
                                  if (isSelected)
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: AnimatedOpacity(
                                        duration: const Duration(milliseconds: 200),
                                        opacity: isSelected ? 1.0 : 0.0,
                                        child: Container(
                                          width: ResponsiveHelper.getScaledWidth(context, 20),
                                          height: ResponsiveHelper.getScaledHeight(context, 20),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFFBFF6),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: ResponsiveHelper.getScaledFontSize(context, 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            ResponsiveHelper.getResponsiveSizedBox(context, height: 6),
                            Flexible(
                              child: Text(
                                industry['name']!,
                                style: GoogleFonts.openSans(
                                  fontSize: ResponsiveHelper.getScaledFontSize(context, 11),
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFD5F1FF),
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 30),
                
                // Botón Continuar
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/location',
                        arguments: {
                          'selectedProfile': widget.selectedProfile,
                          'selectedLanguage': widget.selectedLanguage,
                          'selectedIndustries': selectedIndustries.toList(),
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: ResponsiveHelper.getScaledHeight(context, 48),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD5F1FF),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          'Continuar',
                          style: GoogleFonts.openSans(
                            fontSize: ResponsiveHelper.getScaledFontSize(context, 18),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F0F0F),
                          ),
                        ),
                      ),
                    ),
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
}
