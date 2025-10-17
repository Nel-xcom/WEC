import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class LanguageSelectionScreen extends StatefulWidget {
  final String selectedProfile;
  
  const LanguageSelectionScreen({
    super.key,
    required this.selectedProfile,
  });

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'es_ar';
  bool isDropdownOpen = false;

  final List<Map<String, String>> languages = [
    {'code': 'es_ar', 'name': 'Español (AR)', 'flag': '🇦🇷'},
    {'code': 'es_es', 'name': 'Español (ES)', 'flag': '🇪🇸'},
    {'code': 'es_mx', 'name': 'Español (MX)', 'flag': '🇲🇽'},
    {'code': 'en_us', 'name': 'English (US)', 'flag': '🇺🇸'},
    {'code': 'en_gb', 'name': 'English (UK)', 'flag': '🇬🇧'},
    {'code': 'pt_br', 'name': 'Português (BR)', 'flag': '🇧🇷'},
    {'code': 'pt_pt', 'name': 'Português (PT)', 'flag': '🇵🇹'},
    {'code': 'fr_fr', 'name': 'Français (FR)', 'flag': '🇫🇷'},
    {'code': 'de_de', 'name': 'Deutsch (DE)', 'flag': '🇩🇪'},
    {'code': 'it_it', 'name': 'Italiano (IT)', 'flag': '🇮🇹'},
    {'code': 'zh_cn', 'name': '中文 (CN)', 'flag': '🇨🇳'},
    {'code': 'ja_jp', 'name': '日本語 (JP)', 'flag': '🇯🇵'},
    {'code': 'ko_kr', 'name': '한국어 (KR)', 'flag': '🇰🇷'},
    {'code': 'ru_ru', 'name': 'Русский (RU)', 'flag': '🇷🇺'},
    {'code': 'ar_sa', 'name': 'العربية (SA)', 'flag': '🇸🇦'},
    {'code': 'hi_in', 'name': 'हिन्दी (IN)', 'flag': '🇮🇳'},
    {'code': 'nl_nl', 'name': 'Nederlands (NL)', 'flag': '🇳🇱'},
    {'code': 'sv_se', 'name': 'Svenska (SE)', 'flag': '🇸🇪'},
    {'code': 'no_no', 'name': 'Norsk (NO)', 'flag': '🇳🇴'},
    {'code': 'da_dk', 'name': 'Dansk (DK)', 'flag': '🇩🇰'},
    {'code': 'fi_fi', 'name': 'Suomi (FI)', 'flag': '🇫🇮'},
    {'code': 'pl_pl', 'name': 'Polski (PL)', 'flag': '🇵🇱'},
    {'code': 'tr_tr', 'name': 'Türkçe (TR)', 'flag': '🇹🇷'},
    {'code': 'th_th', 'name': 'ไทย (TH)', 'flag': '🇹🇭'},
    {'code': 'vi_vn', 'name': 'Tiếng Việt (VN)', 'flag': '🇻🇳'},
  ];

  String get currentLanguageName {
    return languages.firstWhere((lang) => lang['code'] == selectedLanguage)['name']!;
  }

  String get currentLanguageFlag {
    return languages.firstWhere((lang) => lang['code'] == selectedLanguage)['flag']!;
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
                    'Selecciona tu idioma',
                    style: GoogleFonts.openSans(
                      fontSize: ResponsiveHelper.getScaledFontSize(context, 20.0),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFD5F1FF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 30),
                
                // Selector de idioma con dropdown
                Padding(
                  padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 20.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDropdownOpen = !isDropdownOpen;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: ResponsiveHelper.getScaledHeight(context, 48),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2E2E2E).withOpacity(0.38),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFFFBFF6).withOpacity(0.7),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: ResponsiveHelper.getResponsivePadding(context, horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  currentLanguageFlag,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.getScaledFontSize(context, 20),
                                  ),
                                ),
                                ResponsiveHelper.getResponsiveSizedBox(context, width: 12),
                                Expanded(
                                  child: Text(
                                    currentLanguageName,
                                    style: GoogleFonts.openSans(
                                      fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: ResponsiveHelper.getScaledFontSize(context, 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      // Dropdown de idiomas
                      if (isDropdownOpen)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: ResponsiveHelper.getScaledHeight(context, 200),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F0F0F),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFFFBFF6).withOpacity(0.7),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: languages.map((language) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = language['code']!;
                                      isDropdownOpen = false;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: ResponsiveHelper.getResponsivePadding(context, 
                                      horizontal: 16.0, 
                                      vertical: 10.0
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          language['flag']!,
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.getScaledFontSize(context, 18),
                                          ),
                                        ),
                                        ResponsiveHelper.getResponsiveSizedBox(context, width: 12),
                                        Expanded(
                                          child: Text(
                                            language['name']!,
                                            style: GoogleFonts.openSans(
                                              fontSize: ResponsiveHelper.getScaledFontSize(context, 15),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        if (selectedLanguage == language['code'])
                                          Icon(
                                            Icons.check,
                                            color: const Color(0xFFFFBFF6),
                                            size: ResponsiveHelper.getScaledFontSize(context, 16),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                    ],
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
                        '/industry-selection',
                        arguments: {
                          'selectedProfile': widget.selectedProfile,
                          'selectedLanguage': selectedLanguage,
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
