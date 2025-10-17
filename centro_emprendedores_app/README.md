# 🚀 Centro Mundial de Emprendedores - App Flutter

## 📱 Descripción
Aplicación multiplataforma para el Centro Mundial de Emprendedores desarrollada en Flutter con backend en Python/FastAPI.

## 🎨 Diseño UI/UX
- **Pantalla de inicio** con diseño elegante y gradientes
- **Tipografía**: Nico Moji para logo, Open Sans para texto general
- **Colores**: Gradiente azul-rosa (#D5F1FF → #FFBFF6) sobre fondo oscuro (#0F0F0F)
- **Efectos**: Sombras sutiles y efectos de iluminación

## 🏗️ Estructura del Proyecto

```
centro_emprendedores_app/
├── lib/
│   ├── constants/
│   │   └── app_constants.dart      # Colores y estilos
│   ├── screens/
│   │   ├── welcome_screen.dart     # Pantalla de inicio
│   │   ├── register_screen.dart     # Registro de usuarios
│   │   └── login_screen.dart       # Inicio de sesión
│   └── main.dart                   # App principal
├── backend/
│   ├── main.py                     # API FastAPI
│   ├── requirements.txt            # Dependencias Python
│   └── README.md                   # Documentación backend
└── pubspec.yaml                    # Dependencias Flutter
```

## 🚀 Instalación y Ejecución

### Frontend (Flutter)
```bash
# Instalar dependencias
flutter pub get

# Ejecutar en web (recomendado para desarrollo)
flutter run -d chrome

# Ejecutar en Android
flutter run -d android

# Ejecutar en iOS (requiere macOS)
flutter run -d ios
```

### Backend (Python)
```bash
# Activar entorno virtual
venv\Scripts\activate

# Instalar dependencias
cd centro_emprendedores_app/backend
pip install -r requirements.txt

# Ejecutar servidor
python main.py
```

## 📡 API Endpoints

### Autenticación
- `POST /auth/register` - Registro de usuarios
- `POST /auth/login` - Inicio de sesión
- `GET /auth/me` - Información del usuario actual

### Proyectos
- `POST /projects` - Crear proyecto
- `GET /projects` - Listar proyectos
- `GET /projects/{id}` - Obtener proyecto específico

### Documentación
- `GET /docs` - Swagger UI
- `GET /redoc` - ReDoc

## 🎯 Funcionalidades Implementadas

### ✅ Frontend
- [x] Pantalla de bienvenida con diseño de Figma
- [x] Pantallas de registro y login
- [x] Navegación entre pantallas
- [x] Gradientes y efectos visuales
- [x] Tipografías personalizadas
- [x] Botones con sombras sutiles

### ✅ Backend
- [x] API REST con FastAPI
- [x] Autenticación JWT
- [x] Modelos de usuario y proyecto
- [x] Base de datos SQLite
- [x] Documentación automática
- [x] CORS configurado

## 🔧 Próximos Pasos

### Frontend
- [ ] Conectar con API backend
- [ ] Implementar gestión de estado (Provider)
- [ ] Pantalla de dashboard principal
- [ ] Gestión de proyectos
- [ ] Perfil de usuario
- [ ] Notificaciones

### Backend
- [ ] Migraciones de base de datos
- [ ] Validación de datos mejorada
- [ ] Upload de archivos
- [ ] Sistema de notificaciones
- [ ] Tests unitarios
- [ ] Deploy en producción

## 🛠️ Tecnologías

### Frontend
- **Flutter** - Framework multiplataforma
- **Dart** - Lenguaje de programación
- **Google Fonts** - Tipografías
- **Material Design** - Componentes UI

### Backend
- **FastAPI** - Framework web moderno
- **SQLAlchemy** - ORM para base de datos
- **Pydantic** - Validación de datos
- **JWT** - Autenticación
- **SQLite** - Base de datos (desarrollo)

## 📱 Plataformas Soportadas
- ✅ **Web** (Chrome, Firefox, Safari)
- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 11+)
- ✅ **Windows** (Windows 10+)
- ✅ **macOS** (macOS 10.14+)
- ✅ **Linux** (Ubuntu 18.04+)

## 🤝 Contribución
1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia
Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.