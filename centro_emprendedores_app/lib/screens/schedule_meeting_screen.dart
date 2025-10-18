import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleMeetingScreen extends StatefulWidget {
  const ScheduleMeetingScreen({super.key});

  @override
  State<ScheduleMeetingScreen> createState() => _ScheduleMeetingScreenState();
}

class _ScheduleMeetingScreenState extends State<ScheduleMeetingScreen> {
  String selectedMonth = 'Oct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Column(
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
                    // Título principal
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Agendar reunión',
                        style: GoogleFonts.openSans(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD5F1FF),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    // Selector de fecha actual y botón de mes
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Fecha actual
                          Text(
                            'Jueves 9 de octubre',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFD5F1FF),
                            ),
                          ),
                          // Botón seleccionar mes
                          GestureDetector(
                            onTap: () {
                              _showMonthSelectorBottomSheet(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFD5F1FF),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    '/WEC/assets/images/icons/calendar.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Seleccionar mes',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: const Color(0xFFD5F1FF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    // Selector horizontal de días
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Días de la semana
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: ['L', 'M', 'M', 'J', 'V', 'S', 'D'].map((day) => 
                              Text(
                                day,
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ).toList(),
                          ),
                          SizedBox(height: 10),
                          // Fechas con navegación
                          Row(
                            children: [
                              // Flecha izquierda
                              GestureDetector(
                                onTap: () {
                                  // TODO: Implementar navegación de fechas
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Transform.rotate(
                                    angle: 1.5708, // +90 grados (para que apunte a la izquierda)
                                    child: Image.asset(
                                      '/WEC/assets/images/icons/down-arrow.png',
                                      width: 16,
                                      height: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              // Fechas
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [6, 7, 8, 9, 10, 11, 12].map((date) => 
                                    GestureDetector(
                                      onTap: () {
                                        // TODO: Implementar selección de fecha
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                                        child: Column(
                                          children: [
                                            Text(
                                              date.toString(),
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                color: const Color(0xFFD5F1FF),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            if (date == 9) ...[
                                              Container(
                                                width: 20,
                                                height: 2,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFFFBFF6),
                                                  borderRadius: BorderRadius.circular(1),
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Container(
                                                width: 4,
                                                height: 4,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFFFBFF6),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).toList(),
                                ),
                              ),
                              // Flecha derecha
                              GestureDetector(
                                onTap: () {
                                  // TODO: Implementar navegación de fechas
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Transform.rotate(
                                    angle: -1.5708, // -90 grados (para que apunte a la derecha)
                                    child: Image.asset(
                                      '/WEC/assets/images/icons/down-arrow.png',
                                      width: 16,
                                      height: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Línea rosa debajo de los números
                          Container(
                            height: 1,
                            color: const Color(0xFFFFBFF6),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    
                    // Horarios disponibles - Lista vertical simple
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _buildTimeSlot('9 am', false),
                          SizedBox(height: 10),
                          _buildTimeSlot('10 am', false),
                          SizedBox(height: 10),
                          _buildTimeSlot('11 am', false),
                          SizedBox(height: 10),
                          _buildTimeSlot('12 am', false),
                          SizedBox(height: 10),
                          _buildTimeSlot('13 pm', true), // Seleccionado
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    
                    // Botón principal "Agendar reunión"
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8, // 80% de la pantalla
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              const Color(0xFFD5F1FF),
                              const Color(0xFFFFBFF6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50), // 100% redondeado
                        ),
                        child: Center(
                          child: Text(
                            'Agendar reunión',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
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
              '/WEC/assets/images/icons/hamburger.png',
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
              '/WEC/assets/images/icons/bell.png',
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
            _buildNavItem(context, '/WEC/assets/images/icons/home.png', true),
            _buildNavItem(context, '/WEC/assets/images/icons/return-of-investment.png', false),
            _buildNavItem(context, '/WEC/assets/images/icons/video-editing.png', false),
            _buildNavItem(context, '/WEC/assets/images/icons/group-chat.png', false),
            _buildNavItem(context, '/WEC/assets/images/icons/web.png', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconPath, bool isActive) {
    // Ajustar tamaño específico para group-chat que se ve más pequeño
    double iconSize = iconPath.contains('group-chat') 
        ? 36 
        : 28;
    
    // Determinar la ruta basada en el icono
    String route = '/marketplace'; // Default
    if (iconPath.contains('return-of-investment')) {
      route = '/find-capital';
    } else if (iconPath.contains('video-editing')) {
      route = '/video-editing';
    } else if (iconPath.contains('group-chat')) {
      route = '/group-chat';
    } else if (iconPath.contains('web')) {
      route = '/web';
    }
    
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

  Widget _buildTimeSlot(String time, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // TODO: Implementar selección de horario
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[800] : const Color(0xFF141414).withOpacity(0.28),
          border: Border.all(
            color: const Color(0xFFFFBFF6),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFD5F1FF) : Colors.grey[600],
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 6),
            Text(
              time,
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.grey[300],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMonthSelectorBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F0F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Handle para deslizar
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFAEAEAE).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  
                  // Contenido del bottom sheet
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título con icono
                          Row(
                            children: [
                              Image.asset(
                                '/WEC/assets/images/icons/calendar.png',
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Seleccionar mes',
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFD5F1FF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          
                          // Grid de meses 3x4
                          Expanded(
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: 1.2,
                              ),
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                final months = [
                                  'Ene', 'Feb', 'Mar', 'Abr',
                                  'May', 'Jun', 'Jul', 'Ago',
                                  'Sept', 'Oct', 'Nov', 'Dic'
                                ];
                                final month = months[index];
                                final isSelected = month == selectedMonth;
                                
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedMonth = month;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected 
                                        ? const Color(0xFF2A2A2A)
                                        : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      border: isSelected
                                        ? Border.all(
                                            color: const Color(0xFFD5F1FF).withOpacity(0.3),
                                            width: 1,
                                          )
                                        : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        month,
                                        style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFFD5F1FF),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          
                          SizedBox(height: 20),
                          
                          // Botón Aceptar
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      const Color(0xFFD5F1FF),
                                      const Color(0xFFFFBFF6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.45),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Aceptar',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}
