# 📜 Scripts - AgentCamp 2026 Madrid

Esta carpeta contiene scripts útiles para la gestión del repositorio.

## 📦 create-release-package.sh

Script para crear paquetes de release localmente sin necesidad de usar GitHub Actions.

### 🚀 Uso

```bash
# Crear release con versión específica
./scripts/create-release-package.sh 1.0.0

# Sin especificar versión (usa 1.0.0 por defecto)
./scripts/create-release-package.sh
```

### ✨ Características

El script automáticamente:
- ✅ Verifica que estés en el directorio correcto
- ✅ Crea la estructura de directorios
- ✅ Copia todos los materiales del evento
- ✅ Genera un archivo `RELEASE_INFO.txt` con información detallada
- ✅ Crea paquetes **ZIP** y **TAR.GZ**
- ✅ Calcula **checksums SHA256** para verificación de integridad
- ✅ Muestra estadísticas del paquete generado
- ✅ Limpia archivos temporales (opcional)

### 📦 Archivos Generados

```
agentcamp-madrid-2026-v1.0.0.zip          # Paquete ZIP
agentcamp-madrid-2026-v1.0.0.zip.sha256   # Checksum del ZIP
agentcamp-madrid-2026-v1.0.0.tar.gz       # Paquete TAR.GZ
agentcamp-madrid-2026-v1.0.0.tar.gz.sha256 # Checksum del TAR.GZ
```

### 🎯 Contenido del Paquete

Cada paquete incluye:

```
agentcamp-madrid-2026-v1.0.0/
├── README.md                  # Documentación completa
├── LICENSE                    # Licencia del proyecto
├── CODE_OF_CONDUCT.md        # Código de conducta
├── RELEASE_INFO.txt          # Información de la release
├── branding/                 # Logos y materiales visuales
│   ├── AgentCamp 2026 - Madrid.png
│   ├── AgentCamp logo fondo transparente.png
│   └── ...más archivos
├── speakers/                 # Información de ponentes
├── sponsors/                 # Información de patrocinadores
└── templates/                # Plantillas de presentación
    └── AgentCamp 2026.pptx
```

### 🔐 Verificación de Integridad

Los usuarios pueden verificar que su descarga es auténtica:

**Linux/macOS:**
```bash
sha256sum -c agentcamp-madrid-2026-v1.0.0.zip.sha256
```

**Windows (PowerShell):**
```powershell
$hash = Get-FileHash agentcamp-madrid-2026-v1.0.0.zip -Algorithm SHA256
$expected = Get-Content agentcamp-madrid-2026-v1.0.0.zip.sha256
if ($hash.Hash -eq ($expected -split ' ')[0]) {
    Write-Host "✅ Checksum válido"
} else {
    Write-Host "❌ Checksum inválido"
}
```

### ⚙️ Requisitos

El script requiere:
- **bash** (incluido en Linux/macOS, disponible en Git Bash para Windows)
- **zip** (para crear archivos ZIP)
- **tar** (para crear archivos TAR.GZ)
- **sha256sum** (para calcular checksums)

Estas herramientas suelen estar preinstaladas en Linux/macOS. En Windows, están disponibles con Git Bash.

### 🐧 Instalación de Dependencias

**Ubuntu/Debian:**
```bash
sudo apt-get install zip tar coreutils
```

**macOS:**
```bash
# Herramientas ya instaladas por defecto
# Si necesitas actualizar:
brew install coreutils
```

**Windows:**
```bash
# Usa Git Bash (incluido con Git for Windows)
# Descarga desde: https://git-scm.com/download/win
```

### 🎨 Ejemplo de Salida

```
╔═══════════════════════════════════════════════════╗
║   AgentCamp 2026 - Release Package Creator       ║
║   Global AI Community Spain                       ║
╚═══════════════════════════════════════════════════╝

ℹ️  Creando paquete de release para versión: 1.0.0
ℹ️  Creando estructura de directorios...
ℹ️  Copiando archivos principales...
ℹ️  Copiando contenido...
✅ Copiado: branding/
✅ Copiado: speakers/
✅ Copiado: sponsors/
✅ Copiado: templates/
ℹ️  Generando archivo de información de release...
✅ Archivo RELEASE_INFO.txt creado
ℹ️  Generando estadísticas...
ℹ️  Creando archivo ZIP...
✅ Archivo ZIP creado: agentcamp-madrid-2026-v1.0.0.zip
ℹ️  Creando archivo TAR.GZ...
✅ Archivo TAR.GZ creado: agentcamp-madrid-2026-v1.0.0.tar.gz
ℹ️  Generando checksums SHA256...
✅ Checksums generados

╔═══════════════════════════════════════════════════╗
║   ✨ Paquete de Release Creado Exitosamente ✨   ║
╚═══════════════════════════════════════════════════╝

📊 Estadísticas del Paquete:
   • Versión: 1.0.0
   • Total de archivos: 42
   • Tamaño total: 15M

📦 Archivos generados:
   • agentcamp-madrid-2026-v1.0.0.tar.gz (12M)
   • agentcamp-madrid-2026-v1.0.0.tar.gz.sha256 (4.0K)
   • agentcamp-madrid-2026-v1.0.0.zip (14M)
   • agentcamp-madrid-2026-v1.0.0.zip.sha256 (4.0K)

🔐 Para verificar la integridad de los archivos:
   sha256sum -c agentcamp-madrid-2026-v1.0.0.zip.sha256
   sha256sum -c agentcamp-madrid-2026-v1.0.0.tar.gz.sha256

🎉 ¡Proceso completado con éxito!
Gracias por contribuir a AgentCamp 2026! 🚀
```

### 🤝 Comparación con GitHub Actions

| Característica | Script Local | GitHub Actions |
|----------------|--------------|----------------|
| **Velocidad** | ⚡ Inmediata | ⏱️ 2-3 minutos |
| **Requisitos** | Bash, zip, tar | Ninguno |
| **Ubicación** | Local | GitHub Release |
| **Auto-publish** | ❌ No | ✅ Sí |
| **Checksums** | ✅ Sí | ✅ Sí |
| **Release Notes** | ❌ Manual | ✅ Automático |

**Cuándo usar cada uno:**
- 🏠 **Script local**: Testing, desarrollo, distribución rápida
- ☁️ **GitHub Actions**: Releases oficiales, distribución pública

### 📚 Recursos Adicionales

- [Guía completa de Releases](../.github/RELEASE_GUIDE.md)
- [CHANGELOG](../CHANGELOG.md)
- [GitHub Workflow](../.github/workflows/release.yml)

### 🐛 Solución de Problemas

**Error: "Este script debe ejecutarse desde la raíz del repositorio"**
```bash
# Asegúrate de estar en la raíz:
cd /ruta/al/agentcamp-madrid-2026
./scripts/create-release-package.sh 1.0.0
```

**Error: "Directorio requerido no encontrado"**
```bash
# Verifica que tengas todas las carpetas:
ls -la branding/ speakers/ sponsors/ templates/
```

**Permisos denegados (Permission denied)**
```bash
# Haz el script ejecutable:
chmod +x scripts/create-release-package.sh
```

### 💡 Tips

1. **Versiona semánticamente**: Usa `MAJOR.MINOR.PATCH` (ej: `1.0.0`, `1.1.0`, `2.0.0`)
2. **Actualiza CHANGELOG**: Antes de crear una release, actualiza `CHANGELOG.md`
3. **Verifica contenido**: Extrae el paquete y revisa que todo esté correcto
4. **Checksums siempre**: Proporciona siempre los archivos `.sha256` con tus distribuciones

### 🎓 Aprende Más

Para aprender más sobre releases y versionado:
- [Semantic Versioning](https://semver.org/lang/es/)
- [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/)
- [GitHub Releases Documentation](https://docs.github.com/en/repositories/releasing-projects-on-github)

---

**¿Preguntas o sugerencias?**

Abre un issue en GitHub o contacta a los organizadores del evento.

**Hecho con ❤️ por Global AI Community Spain**
