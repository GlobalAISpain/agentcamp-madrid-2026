#!/bin/bash
# Script para crear un paquete de release local de AgentCamp 2026
# Uso: ./create-release-package.sh [VERSION]

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir con color
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Banner
echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════════════════╗
║   AgentCamp 2026 - Release Package Creator       ║
║   Global AI Community Spain                       ║
╚═══════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

# Verificar si se proporcionó una versión
VERSION=${1:-"1.0.0"}
print_info "Creando paquete de release para versión: ${VERSION}"

# Verificar que estamos en el directorio correcto
if [ ! -f "README.md" ] || [ ! -d ".git" ]; then
    print_error "Este script debe ejecutarse desde la raíz del repositorio"
    exit 1
fi

# Verificar que existen las carpetas necesarias
REQUIRED_DIRS=("branding" "speakers" "sponsors" "templates")
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        print_error "Directorio requerido no encontrado: $dir"
        exit 1
    fi
done

# Nombre del paquete
PACKAGE_NAME="agentcamp-madrid-2026-v${VERSION}"
TEMP_DIR="release-temp"
PACKAGE_DIR="${TEMP_DIR}/${PACKAGE_NAME}"

# Limpiar directorio temporal si existe
if [ -d "$TEMP_DIR" ]; then
    print_info "Limpiando directorio temporal anterior..."
    rm -rf "$TEMP_DIR"
fi

# Crear estructura de directorios
print_info "Creando estructura de directorios..."
mkdir -p "$PACKAGE_DIR"

# Copiar archivos principales
print_info "Copiando archivos principales..."
cp README.md "$PACKAGE_DIR/" 2>/dev/null || print_warning "README.md no encontrado"
cp LICENSE "$PACKAGE_DIR/" 2>/dev/null || print_warning "LICENSE no encontrado"
cp CODE_OF_CONDUCT.md "$PACKAGE_DIR/" 2>/dev/null || print_warning "CODE_OF_CONDUCT.md no encontrado"

# Copiar carpetas de contenido
print_info "Copiando contenido..."
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        cp -r "$dir" "$PACKAGE_DIR/"
        print_success "Copiado: $dir/"
    fi
done

# Crear archivo de información de release
print_info "Generando archivo de información de release..."
cat > "$PACKAGE_DIR/RELEASE_INFO.txt" << EOF
╔═══════════════════════════════════════════════════════════════╗
║           AgentCamp 2026 - Madrid                             ║
║           Paquete de Release Oficial                          ║
╚═══════════════════════════════════════════════════════════════╝

Release Version: ${VERSION}
Release Date: $(date +"%Y-%m-%d %H:%M:%S")
Package Created: $(date)

═══════════════════════════════════════════════════════════════

📁 CONTENIDO DEL PAQUETE
═══════════════════════════════════════════════════════════════

Este paquete contiene todos los materiales oficiales del evento
AgentCamp 2026 Madrid (anteriormente Global AI Bootcamp).

Archivos incluidos:

📄 Documentación:
   • README.md - Información completa del evento
   • LICENSE - Licencia del proyecto  
   • CODE_OF_CONDUCT.md - Código de conducta de la comunidad

🎨 branding/
   • Logos oficiales en múltiples formatos
   • Gráficos para redes sociales
   • Materiales de marketing
   • Códigos QR del evento

🎤 speakers/
   • Información de ponentes
   • Biografías y perfiles
   • Abstracts de sesiones

🤝 sponsors/
   • Logos de patrocinadores
   • Información de sponsorships
   • Niveles de patrocinio

📋 templates/
   • Plantilla oficial de PowerPoint
   • Guías de uso para presentadores
   • Templates de comunicación

═══════════════════════════════════════════════════════════════

📅 INFORMACIÓN DEL EVENTO
═══════════════════════════════════════════════════════════════

🎓 Workshops - Viernes 27 de Febrero de 2026
   📍 Ubicación: NTT DATA Spain
                 Novus Building
                 Cam. de la Fuente de la Mora, 1
                 28050 Madrid, España
   
   ⏰ Horarios:
      • Sesión mañana: 10:00 - 14:00
      • Sesión tarde:  15:00 - 19:00
   
   🛠️ 6 talleres prácticos de 4 horas cada uno

🎤 Conferencia Principal - Sábado 28 de Febrero de 2026
   📍 Ubicación: Escuela Politécnica Superior - Universidad CEU San Pablo
                 Av. de Montepríncipe, s/n
                 28668 Boadilla del Monte, Madrid, España
   
   ⏰ Horario: 08:30 - 19:00
   
   🎯 8 tracks simultáneos
   📊 Más de 60 sesiones técnicas
   🎪 Zona de networking y stands

═══════════════════════════════════════════════════════════════

🎯 TEMÁTICAS PRINCIPALES
═══════════════════════════════════════════════════════════════

• 🤖 Agentes de IA y arquitecturas multiagente
• 🔌 Model Context Protocol (MCP)
• 🏭 Microsoft Foundry
  - Foundry Agent Service
  - Foundry Models (Azure OpenAI, Llama, Phi, DeepSeek-R1)
  - Foundry IQ
  - Foundry Tools
• 💡 Microsoft Copilot y sus integraciones
• 📊 Microsoft Fabric con análisis de datos e IA
• 🎓 Azure Machine Learning
• 🛠️ Speech, Vision, Translator, Document Intelligence

═══════════════════════════════════════════════════════════════

🔗 ENLACES ÚTILES
═══════════════════════════════════════════════════════════════

🌐 Website Oficial:
   https://www.globalai.es

📅 Agenda y Sesiones:
   https://agentcamp.sessionize.com

🎟️ Registro y Entradas (GRATIS):
   https://www.eventbrite.es/e/entradas-agentcamp-2026-madrid-aka-global-ai-bootcamp-1980480271806

💬 Comunidad Global AI:
   https://globalai.community/

📧 GitHub Repository:
   https://github.com/GlobalAISpain/agentcamp-madrid-2026

═══════════════════════════════════════════════════════════════

👥 ORGANIZADORES
═══════════════════════════════════════════════════════════════

Este evento es organizado por Microsoft MVPs y líderes de
comunidades técnicas locales:

• Alejandro López de la Fuente (Microsoft MVP)
• Carlos Cámara (Microsoft MVP)
• Alberto Diaz (Microsoft MVP)
• David Salgado (Microsoft MVP)
• Sergio Hernández
• Alejandro Almeida (Microsoft MVP)

═══════════════════════════════════════════════════════════════

🌍 ALCANCE GLOBAL
═══════════════════════════════════════════════════════════════

AgentCamp es parte de la Global AI Community:

• 177 comunidades participantes
• 71 países alrededor del mundo
• Miles de asistentes globalmente
• 100% gratuito y comunitario

═══════════════════════════════════════════════════════════════

📜 LICENCIA Y USO
═══════════════════════════════════════════════════════════════

Este material está disponible según los términos especificados
en el archivo LICENSE incluido en este paquete.

Para cualquier uso de los materiales de branding, por favor
consulta las guías de uso incluidas.

═══════════════════════════════════════════════════════════════

💖 AGRADECIMIENTOS
═══════════════════════════════════════════════════════════════

Gracias por tu interés en AgentCamp 2026 Madrid!

Este es un evento comunitario sin ánimo de lucro, organizado
por voluntarios apasionados por la Inteligencia Artificial y
las tecnologías de Microsoft.

Esperamos verte en el evento! 🚀

═══════════════════════════════════════════════════════════════

Para más información, consulta el archivo README.md incluido
en este paquete.

¡Nos vemos en AgentCamp! 🎉
EOF

print_success "Archivo RELEASE_INFO.txt creado"

# Crear estadísticas del paquete
print_info "Generando estadísticas..."
TOTAL_FILES=$(find "$PACKAGE_DIR" -type f | wc -l)
TOTAL_SIZE=$(du -sh "$PACKAGE_DIR" | cut -f1)

# Crear archivo ZIP
print_info "Creando archivo ZIP..."
cd "$TEMP_DIR"
zip -r "../${PACKAGE_NAME}.zip" "$PACKAGE_NAME" > /dev/null
cd ..
print_success "Archivo ZIP creado: ${PACKAGE_NAME}.zip"

# Crear archivo TAR.GZ
print_info "Creando archivo TAR.GZ..."
tar -czf "${PACKAGE_NAME}.tar.gz" -C "$TEMP_DIR" "$PACKAGE_NAME"
print_success "Archivo TAR.GZ creado: ${PACKAGE_NAME}.tar.gz"

# Generar checksums
print_info "Generando checksums SHA256..."
sha256sum "${PACKAGE_NAME}.zip" > "${PACKAGE_NAME}.zip.sha256"
sha256sum "${PACKAGE_NAME}.tar.gz" > "${PACKAGE_NAME}.tar.gz.sha256"
print_success "Checksums generados"

# Mostrar información de los archivos creados
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   ✨ Paquete de Release Creado Exitosamente ✨   ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}📊 Estadísticas del Paquete:${NC}"
echo -e "   • Versión: ${GREEN}${VERSION}${NC}"
echo -e "   • Total de archivos: ${GREEN}${TOTAL_FILES}${NC}"
echo -e "   • Tamaño total: ${GREEN}${TOTAL_SIZE}${NC}"
echo ""
echo -e "${BLUE}📦 Archivos generados:${NC}"
ls -lh "${PACKAGE_NAME}".* | awk '{printf "   • %s (%s)\n", $9, $5}'
echo ""
echo -e "${YELLOW}🔐 Para verificar la integridad de los archivos:${NC}"
echo -e "   ${GREEN}sha256sum -c ${PACKAGE_NAME}.zip.sha256${NC}"
echo -e "   ${GREEN}sha256sum -c ${PACKAGE_NAME}.tar.gz.sha256${NC}"
echo ""

# Opción para limpiar archivos temporales
read -p "$(echo -e ${YELLOW}¿Deseas limpiar los archivos temporales? [Y/n]:${NC} )" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
    print_info "Limpiando archivos temporales..."
    rm -rf "$TEMP_DIR"
    print_success "Archivos temporales eliminados"
else
    print_info "Archivos temporales conservados en: $TEMP_DIR"
fi

echo ""
echo -e "${GREEN}🎉 ¡Proceso completado con éxito!${NC}"
echo -e "${BLUE}Gracias por contribuir a AgentCamp 2026! 🚀${NC}"
echo ""
