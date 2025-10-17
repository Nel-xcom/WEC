# Centro Mundial de Emprendedores - Backend README

## 🚀 Instalación y configuración

### 1. Activar entorno virtual
```bash
# Desde la raíz del proyecto
venv\Scripts\activate
```

### 2. Instalar dependencias del backend
```bash
cd centro_emprendedores_app/backend
pip install -r requirements.txt
```

### 3. Configurar variables de entorno
```bash
# Copiar archivo de ejemplo
copy env_example.txt .env

# Editar .env con tus configuraciones
```

### 4. Ejecutar el servidor
```bash
python main.py
```

## 📡 Endpoints disponibles

### Autenticación
- `POST /auth/register` - Registro de usuarios
- `POST /auth/login` - Inicio de sesión
- `GET /auth/me` - Información del usuario actual

### Proyectos
- `POST /projects` - Crear proyecto (requiere autenticación)
- `GET /projects` - Listar proyectos
- `GET /projects/{id}` - Obtener proyecto específico

### Documentación
- `GET /docs` - Documentación interactiva (Swagger)
- `GET /redoc` - Documentación alternativa

## 🗄️ Base de datos

### Modelos
- **User**: Usuarios del sistema
- **Project**: Proyectos de emprendedores

### Migraciones
```bash
# Crear migración
alembic revision --autogenerate -m "Initial migration"

# Aplicar migración
alembic upgrade head
```

## 🔧 Desarrollo

### Estructura del proyecto
```
backend/
├── main.py              # Aplicación principal
├── requirements.txt     # Dependencias
├── env_example.txt      # Variables de entorno ejemplo
├── models/              # Modelos de datos (futuro)
├── routers/             # Rutas API (futuro)
├── services/            # Lógica de negocio (futuro)
└── tests/               # Pruebas (futuro)
```

### Testing
```bash
pytest
```

### Formateo de código
```bash
black .
flake8 .
```
