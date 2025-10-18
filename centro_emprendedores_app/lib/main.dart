import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/welcome_screen.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/forgot_password_sms_screen.dart';
import 'screens/verification_code_screen.dart';
import 'screens/successful_verification_screen.dart';
import 'screens/terms_conditions_screen.dart';
import 'screens/profile_selection_screen.dart';
import 'screens/language_selection_screen.dart';
import 'screens/industry_selection_screen.dart';
import 'screens/location_screen.dart';
import 'screens/marketplace_screen.dart';
import 'screens/company_detail_screen.dart';
import 'screens/schedule_meeting_screen.dart';
import 'screens/find_capital_screen.dart';
import 'screens/investment_detail_screen.dart';

void main() {
  runApp(const CentroEmprendedoresApp());
}

class CentroEmprendedoresApp extends StatelessWidget {
  const CentroEmprendedoresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centro Mundial de Emprendedores',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.openSans().fontFamily,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/forgot-password-sms': (context) => const ForgotPasswordSMSScreen(),
        '/verification-code': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
          return VerificationCodeScreen(
            contactInfo: args?['contactInfo'] ?? 'correo@ejemplo.com',
            contactType: args?['contactType'] ?? 'correo',
          );
        },
        '/successful-verification': (context) => const SuccessfulVerificationScreen(),
        '/terms-conditions': (context) => const TermsConditionsScreen(),
        '/profile-selection': (context) => const ProfileSelectionScreen(),
        '/language-selection': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
          return LanguageSelectionScreen(
            selectedProfile: args?['selectedProfile'] ?? 'emprendedor',
          );
        },
        '/industry-selection': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
          return IndustrySelectionScreen(
            selectedProfile: args?['selectedProfile'] ?? 'emprendedor',
            selectedLanguage: args?['selectedLanguage'] ?? 'es_ar',
          );
        },
        '/location': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
          return LocationScreen(
            selectedProfile: args?['selectedProfile'] ?? 'emprendedor',
            selectedLanguage: args?['selectedLanguage'] ?? 'es_ar',
            selectedIndustries: args?['selectedIndustries'] ?? [],
          );
        },
        '/marketplace': (context) => const MarketplaceScreen(),
        '/company-detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
          return CompanyDetailScreen(
            companyData: args ?? {},
          );
        },
        '/schedule-meeting': (context) => const ScheduleMeetingScreen(),
        '/find-capital': (context) => const FindCapitalScreen(),
        '/investment-detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
          return InvestmentDetailScreen(
            companyData: args ?? {},
          );
        },
      },
    );
  }
}
