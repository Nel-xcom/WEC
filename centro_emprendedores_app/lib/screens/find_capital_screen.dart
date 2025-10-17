import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindCapitalScreen extends StatefulWidget {
  const FindCapitalScreen({super.key});

  @override
  State<FindCapitalScreen> createState() => _FindCapitalScreenState();
}

class _FindCapitalScreenState extends State<FindCapitalScreen> with TickerProviderStateMixin {
  // Estado para controlar los likes de cada publicación
  final Map<int, bool> likedPosts = {};
  
  // Estado para controlar los likes del carrusel
  final Map<int, bool> likedCarousel = {};

  void _showShareBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF141414),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFAEAEAE).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Title
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 32),
                child: Text(
                  'Compartir publicación',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFD5F1FF),
                  ),
                ),
              ),
              // Social Media Icons Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialIcon(context, 'images/logos/wpplogo.png', 'WhatsApp'),
                      SizedBox(width: 11),
                      _buildSocialIcon(context, 'images/logos/instagram.png', 'Instagram'),
                      SizedBox(width: 11),
                      _buildSocialIcon(context, 'images/logos/google-drive.png', 'Google Drive'),
                      SizedBox(width: 11),
                      _buildSocialIcon(context, 'images/logos/message.png', 'Messages'),
                      SizedBox(width: 11),
                      _buildSocialIcon(context, 'images/logos/mail.png', 'Mail'),
                    ],
                  ),
                ),
              ),
              // Separator Line
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 10),
                height: 1,
                color: Colors.white.withOpacity(0.2),
              ),
              // Copy Link Section
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Copiar link',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD5F1FF),
                        ),
                      ),
                      Image.asset(
                        'images/icons/copy.png',
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.75,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF141414),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                // Drag Handle
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFAEAEAE).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              // Title
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 22),
                child: Text(
                  'Filtros',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFD5F1FF),
                  ),
                ),
              ),
              // Filter Categories
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Industria
                    _buildFilterCategory(
                      context,
                      'assets/images/icons/online-shopping.png',
                      'Industria',
                      ['AI', 'Crypto', 'Ecommerce'],
                    ),
                    SizedBox(height: 24),
                    // Ubicación
                    _buildFilterCategory(
                      context,
                      'assets/images/icons/location.png',
                      'Ubicación',
                      ['Argentina', 'Colombia', 'Chile'],
                    ),
                    SizedBox(height: 24),
                    // Madurez del negocio
                    _buildFilterCategory(
                      context,
                      'assets/images/icons/calendar.png',
                      'Madurez del negocio',
                      ['0-6 Meses', '6 Meses - 1 Año', '1 - 2 Años'],
                    ),
                    SizedBox(height: 24),
                    // Ingreso bruto a 12 meses
                    _buildFilterCategory(
                      context,
                      'assets/images/icons/coin.png',
                      'Ingreso bruto a 12 meses',
                      ['USD 1.000 - 10.000', 'USD 10.000 - 50.000', 'USD 50.000 - 100.000'],
                    ),
                    SizedBox(height: 24),
                    // Nivel de riesgo
                    _buildFilterCategory(
                      context,
                      'assets/images/icons/warning.png',
                      'Nivel de riesgo',
                      ['Bajo', 'Medio', 'Alto'],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
            ],
            ),
              ),
            );
          },
        );
      },
    );
  }

  void _handleLike(int postIndex) {
    likedPosts[postIndex] = !(likedPosts[postIndex] ?? false);
  }

  void _safeHandleLike(int postIndex) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _handleLike(postIndex);
      });
    });
  }


  void _navigateToCompanyDetail(Map<String, dynamic> companyData) {
    Navigator.pushNamed(
      context,
      '/investment-detail',
      arguments: companyData,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      top: 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Filter Icon Row
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _buildTitleRow(context),
                        ),
                        // Subtitle
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _buildSubtitle(context),
                        ),
                        // Inversores Recomendados Section
                        _buildRecommendedInvestors(context),
                        // Selecciona tu industria Section
                        _buildIndustrySelection(context),
                        // Spacing between industry selection and feed
                        SizedBox(height: 20),
                        // Feed Section
                        _buildFeedSection(context),
                        // Content will be added here
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom navigation bar
              _buildBottomNavigationBar(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          // Hamburger menu
          GestureDetector(
            onTap: () {
              // TODO: Implement hamburger menu
            },
            child: Image.asset(
              'assets/images/icons/hamburger.png',
              width: 24,
              height: 24,
            ),
          ),
          // Spacer
          const Spacer(),
          // Logo
          Expanded(
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFD5F1FF), Color(0xFFFFBFF6)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.31, 0.81],
                ).createShader(bounds),
                child: Text(
                  'WEC',
                  style: TextStyle(
                    fontFamily: 'NicoMoji',
                    fontSize: 39,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: 0,
                    height: 0.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Spacer
          const Spacer(),
          // Bell notification
          GestureDetector(
            onTap: () {
              // TODO: Implement notifications
            },
            child: Image.asset(
              'assets/images/icons/bell.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF0F0F0F),
        border: Border(
          top: BorderSide(
            color: Color(0xFF2A2A2A),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavItem(context, 'assets/images/icons/home.png', false, '/marketplace'),
            _buildNavItem(context, 'assets/images/icons/return-of-investment.png', true, '/find-capital'),
            _buildNavItem(context, 'assets/images/icons/video-editing.png', false, '/video-editing'),
            _buildNavItem(context, 'assets/images/icons/group-chat.png', false, '/group-chat'),
            _buildNavItem(context, 'assets/images/icons/web.png', false, '/web'),
          ],
        ),
      ),
    );
  }


  Widget _buildTitleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title
        Text(
          'Find Capital',
          style: GoogleFonts.openSans(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            color: const Color(0xFFD5F1FF),
          ),
        ),
        // Filter Icon
        GestureDetector(
          onTap: _showFilterBottomSheet,
          child: Image.asset(
            'assets/images/icons/filter.png',
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        bottom: 20,
      ),
      child: Text(
        'Conecta con inversores a nivel global',
        style: TextStyle(
          fontSize: 13,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
    );
  }

  Widget _buildRecommendedInvestors(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'Inversores Recomendados',
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD5F1FF),
              ),
            ),
          ),
          // Investors Carousel
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 8, // 8 usuarios como en la imagen
              itemBuilder: (context, index) {
                return _buildInvestorCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvestorCard(BuildContext context, int index) {
    return Container(
      width: 60,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // User Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFFBFF6),
                width: 2,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/icons/client.png',
                width: 30,
                height: 30,
                color: const Color(0xFFFFBFF6),
              ),
            ),
          ),
          // User Name
          Text(
            'User',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildIndustrySelection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Selecciona tu industria',
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD5F1FF),
              ),
            ),
          ),
          // Industry Carousel
          Container(
            height: 155,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 8, // 8 industrias
              itemBuilder: (context, index) {
                return _buildIndustryCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndustryCard(BuildContext context, int index) {
    // Lista de industrias con sus iconos
    final List<Map<String, String>> industries = [
      {'name': 'AI', 'icon': 'microchip.png'},
      {'name': 'Crypto', 'icon': 'bitcoin.png'},
      {'name': 'Ecommerce', 'icon': 'online-shopping.png'},
      {'name': 'Consultoría', 'icon': 'consultation.png'},
      {'name': 'IT', 'icon': 'information-technology.png'},
      {'name': 'Fabricantes', 'icon': 'factory.png'},
      {'name': 'Redes Sociales', 'icon': 'social-media-marketing.png'},
      {'name': 'Otros', 'icon': 'application.png'},
    ];

    final industry = industries[index];

    return Container(
      width: 110,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Industry Card
          Container(
            width: 92,
            height: 125,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFD5F1FF).withOpacity(0.2),
                  const Color(0xFFFFBFF6).withOpacity(0.2),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.31, 0.81],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFD9ECFE).withOpacity(0.9),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/images/icons/${industry['icon']}',
                width: 30,
                height: 30,
                color: const Color(0xFFFFBFF6),
              ),
            ),
          ),
          SizedBox(height: 8),
          // Industry Name
          Text(
            industry['name']!,
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xFFD5F1FF),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconPath, bool isActive, String route) {
    // Ajustar tamaño específico para group-chat que se ve más pequeño
    double iconSize = iconPath.contains('group-chat') 
        ? 36 
        : 28;
    
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
            // Sin color para mantener los colores originales de los iconos
          ),
        ),
      ),
    );
  }


  Widget _buildFeedSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Feed Title
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Feed',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD5F1FF),
              ),
            ),
          ),
          // Feed Posts
          _buildFeedPosts(context),
        ],
      ),
    );
  }

  Widget _buildFeedPosts(BuildContext context) {
    // Lista de datos para las 5 publicaciones del feed
    final List<Map<String, dynamic>> feedPosts = [
      {
        'companyName': 'NELX',
        'category': 'AI',
        'location': 'Buenos Aires',
        'categoryIcon': 'microchip.png',
        'agr': '97%',
        'ttmr': '2.3M',
        'clients': '1.2K',
        'description': 'Plataforma de inteligencia artificial para automatización de procesos empresariales con tecnología de vanguardia.',
        'hasVerifiedData': true,
      },
      {
        'companyName': 'CRYPTOFIN',
        'category': 'Crypto',
        'categoryIcon': 'bitcoin.png',
        'agr': '84%',
        'ttmr': '5.7M',
        'clients': '890',
        'description': 'Exchange de criptomonedas líder en Latinoamérica con tecnología blockchain de última generación.',
        'hasVerifiedData': true,
      },
      {
        'companyName': 'ECOMMERCE+',
        'category': 'E-commerce',
        'categoryIcon': 'online-shopping.png',
        'agr': '92%',
        'ttmr': '3.1M',
        'clients': '2.5K',
        'description': 'Solución integral de e-commerce con herramientas avanzadas de marketing digital y analytics.',
        'hasVerifiedData': false,
      },
      {
        'companyName': 'TECHCONSULT',
        'category': 'Consultoría',
        'categoryIcon': 'consultation.png',
        'agr': '78%',
        'ttmr': '1.8M',
        'clients': '450',
        'description': 'Consultoría tecnológica especializada en transformación digital para empresas medianas y grandes.',
        'hasVerifiedData': true,
      },
      {
        'companyName': 'SOCIALMEDIA PRO',
        'category': 'Redes Sociales',
        'categoryIcon': 'social-media-marketing.png',
        'agr': '89%',
        'ttmr': '4.2M',
        'clients': '1.8K',
        'description': 'Agencia de marketing digital enfocada en redes sociales con estrategias personalizadas para cada cliente.',
        'hasVerifiedData': false,
      },
    ];

    return Column(
      children: feedPosts.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> postData = entry.value;
        return Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: _buildFeedPost(context, postData, index),
        );
      }).toList(),
    );
  }

  Widget _buildFeedPost(BuildContext context, Map<String, dynamic> postData, int postIndex) {
    final isLiked = likedPosts[postIndex] ?? false;
    
    return GestureDetector(
      onTap: () {
        _navigateToCompanyDetail(postData);
      },
      child: Container(
        width: double.infinity,
        height: 380,
        decoration: BoxDecoration(
          color: const Color(0xFF0F0F0F),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.09),
              blurRadius: 7.7,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Header
            _buildCardHeader(context, postData),
            // Main Image
            _buildMainImage(context),
            // Metrics Section
            _buildMetricsSection(context, postData),
            // Spacing between metrics and description
            SizedBox(height: 5),
            // Description
            _buildDescription(context, postData),
            // Spacer to push action buttons to bottom
            Spacer(),
            // Action Buttons
            _buildCardActions(context, postIndex, isLiked),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Company Name with Check Mark (conditional)
          Row(
            children: [
              if (data['hasVerifiedData'] == true) ...[
                Image.asset(
                  'assets/images/icons/check-mark.png',
                  width: 16,
                  height: 16,
                ),
                SizedBox(width: 8),
              ],
              Text(
                data['companyName'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFD5F1FF),
                ),
              ),
            ],
          ),
          // Category
          Row(
            children: [
              Image.asset(
                'assets/images/icons/${data['categoryIcon']}',
                width: 16,
                height: 16,
              ),
              SizedBox(width: 4),
              Text(
                'Categoría: ${data['category']}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainImage(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Image.asset(
          'images/illustrations/photo.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1a1a2e),
                    Color(0xFF16213e),
                    Color(0xFF0f3460),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  color: Colors.white.withOpacity(0.3),
                  size: 50,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMetricsSection(BuildContext context, Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildMetricItem(context, 'assets/images/icons/profit.png', 'AGR ${data['agr']}', '(Crecimiento Anual)'),
          ),
          Expanded(
            child: _buildMetricItem(context, 'assets/images/icons/coin.png', 'TTMR \$${data['ttmr']} USD', '(Ingresos a 12 Meses)'),
          ),
          Expanded(
            child: _buildMetricItem(context, 'assets/images/icons/client.png', 'Clientes: ${data['clients']}', '(Actualmente Activos)'),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(BuildContext context, String iconPath, String value, String description) {
    double iconSize = iconPath.contains('client.png') ? 18 : 16;
    bool hasDropShadow = value.contains('AGR');
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: hasDropShadow ? [
              Shadow(
                color: const Color(0xFFFFBFF6).withOpacity(0.5),
                blurRadius: 12,
                offset: const Offset(0, 0),
              ),
            ] : null,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 10,
            color: const Color(0xFFFFBFF6),
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        width: 300,
        child: Text(
          data['description'],
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
            height: 1.4,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildCardActions(BuildContext context, int postIndex, bool isLiked) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Favorites
          InkWell(
            onTap: () => _safeHandleLike(postIndex),
            child: Column(
              children: [
                Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? const Color(0xFFFFBFF6) : Colors.white,
                  size: 26,
                ),
                SizedBox(height: 4),
                Text(
                  'Favoritos',
                  style: TextStyle(
                    fontSize: 12,
                    color: isLiked ? const Color(0xFFFFBFF6) : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Spacing between buttons
          SizedBox(width: 15),
          // Share
          InkWell(
            onTap: _showShareBottomSheet,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/icons/share.png',
                  width: 26,
                  height: 26,
                ),
                SizedBox(height: 4),
                Text(
                  'Compartir',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(BuildContext context, String iconPath, String label) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement social sharing functionality
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                iconPath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(BuildContext context, String iconPath, String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon and Title Row
        Row(
          children: [
            Image.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD5F1FF),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        // Options Row with arrows
        Row(
          children: [
            // Left Arrow
            GestureDetector(
              onTap: () {
                // TODO: Implement scroll left
              },
              child: Transform.rotate(
                angle: 1.5708, // 90 degrees (apunta izquierda)
                child: Image.asset(
                  'assets/images/icons/down-arrow.png',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
            SizedBox(width: 8),
            // Options List
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: options.map((option) => Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: _buildFilterButton(option),
                  )).toList(),
                ),
              ),
            ),
            SizedBox(width: 8),
            // Right Arrow
            GestureDetector(
              onTap: () {
                // TODO: Implement scroll right
              },
              child: Transform.rotate(
                angle: -1.5708, // -90 degrees (apunta derecha)
                child: Image.asset(
                  'assets/images/icons/down-arrow.png',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterButton(String text) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement filter selection
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xFFD5F1FF),
          ),
        ),
      ),
    );
  }

}

