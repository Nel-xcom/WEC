import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class InvestmentDetailScreen extends StatefulWidget {
  final Map<String, dynamic> companyData;
  
  const InvestmentDetailScreen({Key? key, required this.companyData}) : super(key: key);
  
  @override
  _InvestmentDetailScreenState createState() => _InvestmentDetailScreenState();
}

class _InvestmentDetailScreenState extends State<InvestmentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // Use company data from widget parameter
    final companyData = widget.companyData;

    final String companyName = companyData['name'] ?? 'Empresa';
    final String category = companyData['category'] ?? 'Categoría';
    final String location = companyData['location'] ?? 'Ubicación';
    final bool hasVerifiedData = companyData['hasVerifiedData'] ?? false;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Stack(
        children: [
          Column(
            children: [
              // Header
              _buildHeader(context),
              // Main content area
              Expanded(
                child: Container(
                  color: const Color(0xFF141414).withOpacity(0.28),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Content Block 1 - Company Info
                        _buildContentBlock1(companyName, category, location, hasVerifiedData),
                        SizedBox(height: 10),
                        // Content Block 2 - Investment Container
                        _buildInvestmentContainer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNavigationBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Hamburger Menu
          GestureDetector(
            onTap: () {
              // TODO: Implement menu functionality
            },
            child: Image.asset(
              '/WEC/assets/images/icons/hamburger.png',
              width: 24,
              height: 24,
            ),
          ),
          // WEC Logo
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                Color(0xFFD5F1FF),
                Color(0xFFB8E6FF),
                Color(0xFF9BDBFF),
                Color(0xFF7ED0FF),
                Color(0xFF61C5FF),
                Color(0xFF44BAFF),
                Color(0xFF27AFFF),
                Color(0xFF0AA4FF),
                Color(0xFF0099FF),
                Color(0xFF008EFF),
                Color(0xFF0083FF),
                Color(0xFF0078FF),
                Color(0xFF006DFF),
                Color(0xFF0062FF),
                Color(0xFF0057FF),
                Color(0xFF004CFF),
                Color(0xFF0041FF),
                Color(0xFF0036FF),
                Color(0xFF002BFF),
                Color(0xFF0020FF),
                Color(0xFF0015FF),
                Color(0xFF000AFF),
                Color(0xFF0000FF),
                Color(0xFF0000F5),
                Color(0xFF0000EB),
                Color(0xFF0000E1),
                Color(0xFF0000D7),
                Color(0xFF0000CD),
                Color(0xFF0000C3),
                Color(0xFF0000B9),
                Color(0xFF0000AF),
                Color(0xFF0000A5),
                Color(0xFF00009B),
                Color(0xFF000091),
                Color(0xFF000087),
                Color(0xFF00007D),
                Color(0xFF000073),
                Color(0xFF000069),
                Color(0xFF00005F),
                Color(0xFF000055),
                Color(0xFF00004B),
                Color(0xFF000041),
                Color(0xFF000037),
                Color(0xFF00002D),
                Color(0xFF000023),
                Color(0xFF000019),
                Color(0xFF00000F),
                Color(0xFF000005),
                Color(0xFF000000),
                Color(0xFF0A000A),
                Color(0xFF140014),
                Color(0xFF1E001E),
                Color(0xFF280028),
                Color(0xFF320032),
                Color(0xFF3C003C),
                Color(0xFF460046),
                Color(0xFF500050),
                Color(0xFF5A005A),
                Color(0xFF640064),
                Color(0xFF6E006E),
                Color(0xFF780078),
                Color(0xFF820082),
                Color(0xFF8C008C),
                Color(0xFF960096),
                Color(0xFFA000A0),
                Color(0xFFAA00AA),
                Color(0xFFB400B4),
                Color(0xFFBE00BE),
                Color(0xFFC800C8),
                Color(0xFFD200D2),
                Color(0xFFDC00DC),
                Color(0xFFE600E6),
                Color(0xFFF000F0),
                Color(0xFFFA00FA),
                Color(0xFFFF00FF),
                Color(0xFFFF0AFF),
                Color(0xFFFF14FF),
                Color(0xFFFF1EFF),
                Color(0xFFFF28FF),
                Color(0xFFFF32FF),
                Color(0xFFFF3CFF),
                Color(0xFFFF46FF),
                Color(0xFFFF50FF),
                Color(0xFFFF5AFF),
                Color(0xFFFF64FF),
                Color(0xFFFF6EFF),
                Color(0xFFFF78FF),
                Color(0xFFFF82FF),
                Color(0xFFFF8CFF),
                Color(0xFFFF96FF),
                Color(0xFFFFA0FF),
                Color(0xFFFFAAFF),
                Color(0xFFFFB4FF),
                Color(0xFFFFBEFF),
                Color(0xFFFFC8FF),
                Color(0xFFFFD2FF),
                Color(0xFFFFDCFF),
                Color(0xFFFFE6FF),
                Color(0xFFFFF0FF),
                Color(0xFFFFFAFF),
                Color(0xFFFFFFFF),
                Color(0xFFFFFAFF),
                Color(0xFFFFF0FF),
                Color(0xFFFFE6FF),
                Color(0xFFFFDCFF),
                Color(0xFFFFD2FF),
                Color(0xFFFFC8FF),
                Color(0xFFFFBEFF),
                Color(0xFFFFB4FF),
                Color(0xFFFFAAFF),
                Color(0xFFFFA0FF),
                Color(0xFFFF96FF),
                Color(0xFFFF8CFF),
                Color(0xFFFF82FF),
                Color(0xFFFF78FF),
                Color(0xFFFF6EFF),
                Color(0xFFFF64FF),
                Color(0xFFFF5AFF),
                Color(0xFFFF50FF),
                Color(0xFFFF46FF),
                Color(0xFFFF3CFF),
                Color(0xFFFF32FF),
                Color(0xFFFF28FF),
                Color(0xFFFF1EFF),
                Color(0xFFFF14FF),
                Color(0xFFFF0AFF),
                Color(0xFFFF00FF),
                Color(0xFFFA00FA),
                Color(0xFFF000F0),
                Color(0xFFE600E6),
                Color(0xFFDC00DC),
                Color(0xFFD200D2),
                Color(0xFFC800C8),
                Color(0xFFBE00BE),
                Color(0xFFB400B4),
                Color(0xFFAA00AA),
                Color(0xFFA000A0),
                Color(0xFF960096),
                Color(0xFF8C008C),
                Color(0xFF820082),
                Color(0xFF780078),
                Color(0xFF6E006E),
                Color(0xFF640064),
                Color(0xFF5A005A),
                Color(0xFF500050),
                Color(0xFF460046),
                Color(0xFF3C003C),
                Color(0xFF320032),
                Color(0xFF280028),
                Color(0xFF1E001E),
                Color(0xFF140014),
                Color(0xFF0A000A),
                Color(0xFF000000),
                Color(0xFF000005),
                Color(0xFF00000F),
                Color(0xFF000019),
                Color(0xFF000023),
                Color(0xFF00002D),
                Color(0xFF000037),
                Color(0xFF000041),
                Color(0xFF00004B),
                Color(0xFF000055),
                Color(0xFF00005F),
                Color(0xFF000069),
                Color(0xFF000073),
                Color(0xFF00007D),
                Color(0xFF000087),
                Color(0xFF000091),
                Color(0xFF00009B),
                Color(0xFF0000A5),
                Color(0xFF0000AF),
                Color(0xFF0000B9),
                Color(0xFF0000C3),
                Color(0xFF0000CD),
                Color(0xFF0000D7),
                Color(0xFF0000E1),
                Color(0xFF0000EB),
                Color(0xFF0000F5),
                Color(0xFF0000FF),
                Color(0xFF000AFF),
                Color(0xFF0015FF),
                Color(0xFF0020FF),
                Color(0xFF002BFF),
                Color(0xFF0036FF),
                Color(0xFF0041FF),
                Color(0xFF004CFF),
                Color(0xFF0057FF),
                Color(0xFF0062FF),
                Color(0xFF006DFF),
                Color(0xFF0078FF),
                Color(0xFF0083FF),
                Color(0xFF008EFF),
                Color(0xFF0099FF),
                Color(0xFF0AA4FF),
                Color(0xFF27AFFF),
                Color(0xFF44BAFF),
                Color(0xFF61C5FF),
                Color(0xFF7ED0FF),
                Color(0xFF9BDBFF),
                Color(0xFFB8E6FF),
                Color(0xFFD5F1FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              'WEC',
              style: GoogleFonts.getFont('Nico Moji',
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          // Notification Bell
          GestureDetector(
            onTap: () {
              // TODO: Implement notification functionality
            },
            child: Image.asset(
              '/WEC/assets/images/icons/bell.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentBlock1(String companyName, String category, String location, bool hasVerifiedData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.09),
            blurRadius: 7.7,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company name, category and location
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company name with check mark
              Row(
                children: [
                  if (hasVerifiedData)
                    Image.asset(
                      '/WEC/assets/images/icons/check-mark.png',
                      width: 16,
                      height: 16,
                    ),
                  if (hasVerifiedData) SizedBox(width: 4),
                  Expanded( // Use Expanded for the company name
                    child: Text(
                      companyName,
                      style: GoogleFonts.openSans(
                        fontSize: 23, // +3px from 20
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD5F1FF),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8), // Separation between name and category/location
              // Category and location row
              Row(
                children: [
                  // Category section
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        '/WEC/assets/images/icons/microchip.png',
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Categoría: $category',
                        style: GoogleFonts.openSans(
                          fontSize: 15, // +3px from 12
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16), // Spacing between category and location
                  // Location section
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        '/WEC/assets/images/icons/location.png',
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        location,
                        style: GoogleFonts.openSans(
                          fontSize: 15, // +3px from 12
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          // Description
          Text(
            'Startup de Inteligencia Artificial en etapa Seed que desarrolla un sistema inteligente para automatizar tareas repetitivas y optimizar la toma de decisiones en pequeñas y medianas empresas. Su tecnología reduce costos operativos y mejora la eficiencia en áreas clave como atención al cliente, análisis de datos y gestión interna.',
            style: GoogleFonts.openSans(
              fontSize: 12, // -2px from 14
              color: Colors.white.withOpacity(0.8),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvestmentContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Investment Title
          Text(
            'Información de Inversión',
            style: GoogleFonts.openSans(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFD5F1FF),
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 20),
          // Investment details
          _buildInvestmentDetails(),
        ],
      ),
    );
  }

  Widget _buildInvestmentDetails() {
    return Column(
      children: [
        // Investment amount and equity
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInvestmentMetric('Monto buscado', 'USD 500,000', 'coin.png'),
            _buildInvestmentMetric('Equity ofrecido', '15%', 'profit.png'),
          ],
        ),
        SizedBox(height: 20),
        // Investment stage and timeline
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInvestmentMetric('Etapa', 'Seed', 'calendar.png'),
            _buildInvestmentMetric('Timeline', '6 meses', 'calendar.png'),
          ],
        ),
        SizedBox(height: 20),
        // Use of funds
        _buildUseOfFunds(),
      ],
    );
  }

  Widget _buildInvestmentMetric(String label, String value, String iconPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              '/WEC/assets/images/icons/$iconPath',
              width: 20,
              height: 20,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD5F1FF),
          ),
        ),
      ],
    );
  }

  Widget _buildUseOfFunds() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Uso de fondos:',
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD5F1FF),
          ),
        ),
        SizedBox(height: 8),
        Text(
          '• 40% Desarrollo de producto\n• 30% Marketing y ventas\n• 20% Contratación de talento\n• 10% Operaciones generales',
          style: GoogleFonts.openSans(
            fontSize: 14,
            color: Colors.white.withOpacity(0.8),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 15,
          bottom: MediaQuery.of(context).padding.bottom + 15,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, '/WEC/assets/images/icons/home.png', 'Inicio', '/marketplace'),
            _buildNavItem(context, '/WEC/assets/images/icons/return-of-investment.png', 'Find Capital', '/find-capital'),
            _buildNavItem(context, '/WEC/assets/images/icons/video-editing.png', 'Video', '/video'),
            _buildNavItem(context, '/WEC/assets/images/icons/group-chat.png', 'Chat', '/chat'),
            _buildNavItem(context, '/WEC/assets/images/icons/web.png', 'Web', '/web'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconPath, String label, String route) {
    return GestureDetector(
      onTap: () {
        if (route == '/marketplace' || route == '/find-capital') {
          Navigator.pushNamedAndRemoveUntil(
            context,
            route,
            (route) => false,
          );
        } else {
          // TODO: Implement other routes
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: const Color(0xFFD5F1FF),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: const Color(0xFFD5F1FF),
            ),
          ),
        ],
      ),
    );
  }
}

