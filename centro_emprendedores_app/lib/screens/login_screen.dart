import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

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
                
                // Campo de email
                _buildTextField(
                  context: context,
                  label: 'Usuario o correo',
                  hint: 'username@example.com',
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.person,
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 16),
                
                // Campo de contraseña
                _buildPasswordField(),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 12),
                
                // Checkbox "Recuérdame"
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFFD5F1FF),
                      checkColor: const Color(0xFF0F0F0F),
                    ),
                    Text(
                      'Recuérdame',
                      style: GoogleFonts.openSans(
                        fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                        color: const Color(0xFF787878),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 16),
                
                // "Olvidé mi contraseña" - CENTRADO
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text(
                      'Olvidé mi contraseña',
                      style: GoogleFonts.openSans(
                        fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFD9ECFE),
                      ),
                    ),
                  ),
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 20),
                
                // Botón "Iniciar sesión"
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
                        Navigator.pushNamed(context, '/terms-conditions');
                      },
                      child: Center(
                        child: Text(
                          'Iniciar sesión',
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
                
                // Botones de redes sociales
                _buildSocialButton(
                  iconPath: '/images/logos/images-Photoroom.png', // Google
                  text: 'Iniciar sesión con Google',
                  onTap: () {
                    Navigator.pushNamed(context, '/terms-conditions');
                  },
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 8),
                
                _buildSocialButton(
                  iconPath: '/images/logos/Apple_logo_black.png', // Apple
                  text: 'Iniciar sesión con Apple',
                  onTap: () {
                    Navigator.pushNamed(context, '/terms-conditions');
                  },
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 8),
                
                _buildSocialButton(
                  iconPath: '/images/logos/download.png', // LinkedIn
                  text: 'Iniciar sesión con Linkedin',
                  onTap: () {
                    Navigator.pushNamed(context, '/terms-conditions');
                  },
                ),
                
                ResponsiveHelper.getResponsiveSizedBox(context, height: 16),
                
                // "¿No tienes una cuenta?"
                Column(
                  children: [
                    Text(
                      '¿No tienes una cuenta?',
                      style: GoogleFonts.openSans(
                        fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                        color: const Color(0xFF787878),
                      ),
                    ),
                    ResponsiveHelper.getResponsiveSizedBox(context, height: 2),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text(
                        'Crear una cuenta',
                        style: GoogleFonts.openSans(
                          fontSize: ResponsiveHelper.getScaledFontSize(context, 14),
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFD9ECFE),
                        ),
                      ),
                    ),
                  ],
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

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    required IconData icon,
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
            keyboardType: keyboardType,
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
                icon,
                color: Colors.white.withOpacity(0.7),
                size: ResponsiveHelper.getScaledFontSize(context, 20),
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

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contraseña',
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
            obscureText: _obscurePassword,
            style: GoogleFonts.openSans(
              fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: 'Ingresa tu contraseña',
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
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white.withOpacity(0.7),
                  size: ResponsiveHelper.getScaledFontSize(context, 20),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
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

  Widget _buildSocialButton({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      height: ResponsiveHelper.getScaledHeight(context, 48),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 24),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: ResponsiveHelper.getResponsiveBorderRadius(context, 24),
          onTap: onTap,
          child: Row(
            children: [
              ResponsiveHelper.getResponsiveSizedBox(context, width: 15),
              Image.asset(
                iconPath,
                width: ResponsiveHelper.getScaledWidth(context, 20),
                height: ResponsiveHelper.getScaledHeight(context, 20),
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.business,
                    size: ResponsiveHelper.getScaledFontSize(context, 20),
                    color: Colors.grey,
                  );
                },
              ),
              ResponsiveHelper.getResponsiveSizedBox(context, width: 12),
              Text(
                text,
                style: GoogleFonts.openSans(
                  fontSize: ResponsiveHelper.getScaledFontSize(context, 16),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F0F0F),
                ),
              ),
              ResponsiveHelper.getResponsiveSizedBox(context, width: 60),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
