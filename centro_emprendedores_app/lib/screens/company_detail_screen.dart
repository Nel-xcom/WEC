import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyDetailScreen extends StatefulWidget {
  final Map<String, dynamic> companyData;
  
  const CompanyDetailScreen({
    super.key,
    required this.companyData,
  });

  @override
  State<CompanyDetailScreen> createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Column(
        children: [
          // Header
          _buildHeader(context),
          // Main Content Area
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF141414).withOpacity(0.28),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContentBlock1(context),
                    SizedBox(height: 10),
                    _buildMainContentContainer(context),
                  ],
                ),
              ),
            ),
          ),
          // Bottom Navigation Bar
          _buildBottomNavigationBar(context),
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
            _buildNavItem(context, 'assets/images/icons/home.png', true),
            _buildNavItem(context, 'assets/images/icons/return-of-investment.png', false),
            _buildNavItem(context, 'assets/images/icons/video-editing.png', false),
            _buildNavItem(context, 'assets/images/icons/group-chat.png', false),
            _buildNavItem(context, 'assets/images/icons/web.png', false),
          ],
        ),
      ),
    );
  }

  Widget _buildContentBlock1(BuildContext context) {
    final companyName = widget.companyData['companyName'] ?? 'N/A';
    final category = widget.companyData['category'] ?? 'N/A';
    final location = widget.companyData['location'] ?? 'Buenos Aires';
    final description = widget.companyData['description'] ?? 'No description available.';
    final hasVerifiedData = widget.companyData['hasVerifiedData'] ?? false;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
                      'assets/images/icons/check-mark.png',
                      width: 16,
                      height: 16,
                    ),
                  if (hasVerifiedData) SizedBox(width: 4),
                  Expanded(
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
              SizedBox(height: 8),
              // Category and location row
              Row(
                children: [
                  // Category section
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/icons/microchip.png',
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
                  SizedBox(width: 16),
                  // Location section
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/icons/location.png',
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
          SizedBox(height: 16),
          // Description
          Text(
            'Startup de Inteligencia Artificial en etapa Seed que desarrolla un sistema inteligente para automatizar tareas repetitivas y optimizar la toma de decisiones en pequeñas y medianas empresas. Su tecnología reduce costos operativos y mejora la eficiencia en áreas clave como atención al cliente, análisis de datos y gestión interna.',
            style: GoogleFonts.openSans(
              fontSize: 12, // -2px from 14
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildMainContentContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF0F0F0F),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fecha de lanzamiento y madurez
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Lanzamiento
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/calendar.png',
                      width: 21,
                      height: 21,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Lanzamiento: 21/09/2024',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                // Madurez
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/calendar.png',
                      width: 21,
                      height: 21,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Madurez: 6 Meses',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            // Métricas principales
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Clientes
                Column(
                  children: [
                    Image.asset(
                      'assets/images/icons/client.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Clientes',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '24',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD5F1FF),
                      ),
                    ),
                  ],
                ),
                // % Cancelación
                Column(
                  children: [
                    Image.asset(
                      'assets/images/icons/client.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '% Cancelación',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4.8%',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD5F1FF),
                      ),
                    ),
                  ],
                ),
                // Equipo
                Column(
                  children: [
                    Image.asset(
                      'assets/images/icons/client.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Equipo',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '4',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD5F1FF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25), // +10px desde 15px
            _buildFinancialChart(context),
            SizedBox(height: 35), // Separación de 35px (+15px)
            _buildPriceBlock(context),
            SizedBox(height: 15), // Separación de 15px
            _buildVideoPresentationBlock(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialChart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título
        Text(
          'Situación financiera',
          style: GoogleFonts.openSans(
            fontSize: 23, // Mismo tamaño que el nombre de la empresa
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD5F1FF),
          ),
        ),
        SizedBox(height: 16),
        // Contenedor del gráfico
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 4, // Reducido para minimizar espacio inferior
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A).withOpacity(0.95), // 95% de transparencia
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Barra 1: Ingresos mensuales
              _buildBar(
                value: 'USD 2.850',
                label: 'Ingresos mensuales',
                height: 0.3, // Barra más corta
              ),
              // Barra 2: Ingresos a 12 meses
              _buildBar(
                value: 'USD 28.400',
                label: 'Ingresos a 12 meses',
                height: 1.0, // Barra más alta
              ),
              // Barra 3: Ganancia a 12 meses
              _buildBar(
                value: 'USD 11.200',
                label: 'Ganancia a 12 meses',
                height: 0.6, // Barra mediana
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        // Labels fuera del recuadro
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              child: Text(
                'Ingresos mensuales',
                style: GoogleFonts.openSans(
                  fontSize: 10, // -5px desde 15px
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 80,
              child: Text(
                'Ingresos a 12 meses',
                style: GoogleFonts.openSans(
                  fontSize: 10, // -5px desde 15px
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 80,
              child: Text(
                'Ganancia a 12 meses',
                style: GoogleFonts.openSans(
                  fontSize: 10, // -5px desde 15px
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBar({required String value, required String label, required double height}) {
    return Column(
      children: [
        // Valor encima de la barra
        Text(
          value,
          style: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD5F1FF),
          ),
        ),
        SizedBox(height: 8),
        // Barra con gradiente horizontal
        Container(
          width: 65, // +25px desde 40px
          height: 120 * height, // Altura proporcional
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                const Color(0xFFD5F1FF), // Color izquierdo del gradiente del logo
                const Color(0xFFFFBFF6), // Color derecho del gradiente del logo
              ],
            ),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String iconPath, bool isActive) {
    // Ajustar tamaño específico para group-chat que se ve más pequeño
    double iconSize = iconPath.contains('group-chat') 
        ? 36 
        : 28;
    
    return GestureDetector(
      onTap: () {
        // TODO: Implement navigation
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

  Widget _buildPriceBlock(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Precio con icono centrado
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icono de moneda
              Container(
                width: 24, // -5px desde 29px
                height: 24, // -5px desde 29px
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFFBFF6), // Rosa del gradiente
                    width: 2,
                  ),
                  color: const Color(0xFFFFBFF6).withOpacity(0.2), // Rosa con transparencia
                ),
                child: Center(
                  child: Text(
                    '\$',
                    style: GoogleFonts.openSans(
                      fontSize: 14, // -5px desde 19px
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFFBFF6),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Precio 22.750 USD',
                style: GoogleFonts.openSans(
                  fontSize: 16, // -5px desde 21px
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
            SizedBox(height: 20), // Separación de 20px con el botón
        // Botón "Agendar reunión" centrado y 80% de ancho
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/schedule-meeting');
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // 80% de la pantalla
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8), // -4px desde 12px
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFFD5F1FF), // Azul del gradiente del logo
                    const Color(0xFFFFBFF6), // Rosa del gradiente del logo
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05), // 95% de transparencia
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Agendar reunión',
                  style: GoogleFonts.openSans(
                    fontSize: 16, // -3px desde 19px
                    fontWeight: FontWeight.bold, // Negrita para llamada a la acción
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        // Sección de justificación
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título "Justificación del precio"
            Text(
              'Justificación del precio',
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD5F1FF),
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 12),
            // Descripción con "Ver mas" en la misma línea
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Oportunidad de entrada temprana en una startup con un modelo probado y márgenes atractivos. Con un TTM Profit duplicado (x2), un AGR del 37% sostenido y una base de 24 clientes activos con contratos recurrentes, la compañía proyecta alcanzar el punto de equilibrio en menos de 12 meses. Su tecnología de IA reduce hasta un 35% los co... ',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.4,
                    ),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Implementar funcionalidad de "Ver mas"
                      },
                      child: Text(
                        'Ver mas',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFD5F1FF),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVideoPresentationBlock(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título "Video de presentación"
        Text(
          'Video de presentación',
          style: GoogleFonts.openSans(
            fontSize: 23, // Mismo tamaño que "Situación financiera"
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD5F1FF),
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 16),
        // Video thumbnail
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/illustrations/photo.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        // Título "Al comprarlo adquiere"
        Text(
          'Al comprarlo adquiere',
          style: GoogleFonts.openSans(
            fontSize: 23, // Mismo tamaño que "Situación financiera"
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD5F1FF),
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 12),
        // Descripción
        Text(
          'Algoritmos propios de automatización inteligente, dashboard analítico con IA predictiva, modelo de clasificación de tareas entrenado internamente y diseño de interfaz registrado.',
          style: GoogleFonts.openSans(
            fontSize: 14,
            color: Colors.white.withOpacity(0.8),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
