# 📦 Guía de Releases - AgentCamp 2026 Madrid

Esta guía explica cómo crear y gestionar releases del repositorio para distribuir fácilmente todos los materiales del evento.

## 🚀 Métodos para Crear una Release

### Método 1: Manual Dispatch (Recomendado)

Este es el método más sencillo para crear releases desde la interfaz de GitHub.

1. Ve a la pestaña **"Actions"** en GitHub
2. Selecciona el workflow **"Create Release Package"**
3. Haz clic en **"Run workflow"**
4. Completa los campos:
   - **Branch**: `main` (o la rama que desees)
   - **Version number**: Por ejemplo `1.0.0` (sin la 'v')
   - **Mark as pre-release**: Marca si es una pre-release
5. Haz clic en **"Run workflow"**

El sistema automáticamente:
- ✅ Creará el tag `v1.0.0`
- ✅ Generará paquetes ZIP y TAR.GZ
- ✅ Calculará checksums SHA256
- ✅ Creará la release en GitHub con notas descriptivas
- ✅ Adjuntará todos los archivos

### Método 2: Usando Git Tags

Para usuarios avanzados que prefieren la línea de comandos:

```bash
# 1. Asegúrate de estar en la rama correcta
git checkout main

# 2. Asegúrate de tener los últimos cambios
git pull origin main

# 3. Crea el tag con mensaje
git tag -a v1.0.0 -m "Release version 1.0.0 - AgentCamp 2026 Madrid"

# 4. Sube el tag a GitHub
git push origin v1.0.0
```

El workflow se ejecutará automáticamente al detectar el nuevo tag.

## 📋 Convenciones de Versionado

Seguimos [Semantic Versioning](https://semver.org/):

- **MAJOR** (X.0.0): Cambios importantes o incompatibles
  - Ejemplo: `2.0.0` - Evento del próximo año
  
- **MINOR** (1.X.0): Nuevas funcionalidades compatibles
  - Ejemplo: `1.1.0` - Añadir nuevos speakers o sesiones
  
- **PATCH** (1.0.X): Correcciones de bugs o mejoras menores
  - Ejemplo: `1.0.1` - Corrección de typos, actualización de enlaces

### Ejemplos de Versionado

```
v1.0.0    - Release inicial (antes del evento)
v1.0.1    - Corrección de información errónea
v1.1.0    - Añadidas biografías completas de speakers
v1.2.0    - Añadidos materiales de las presentaciones (post-evento)
v2.0.0    - Materiales para AgentCamp 2027
```

## 📦 Contenido del Paquete de Release

Cada release incluye automáticamente:

### Archivos Principales
- `README.md` - Información completa del evento
- `LICENSE` - Licencia del proyecto
- `CODE_OF_CONDUCT.md` - Código de conducta

### Carpetas de Contenido
- `branding/` - Logos, gráficos y materiales visuales
- `speakers/` - Información de ponentes
- `sponsors/` - Información de patrocinadores
- `templates/` - Plantillas de presentación

### Archivos Generados
- `agentcamp-madrid-2026-vX.X.X.zip` - Paquete ZIP
- `agentcamp-madrid-2026-vX.X.X.tar.gz` - Paquete TAR.GZ
- `*.sha256` - Checksums para verificación
- `RELEASE_INFO.txt` - Información sobre el contenido

## ✅ Verificación de Integridad

Los usuarios pueden verificar la integridad de sus descargas usando los checksums:

### En Linux/macOS:
```bash
sha256sum -c agentcamp-madrid-2026-v1.0.0.zip.sha256
```

### En Windows (PowerShell):
```powershell
$hash = Get-FileHash agentcamp-madrid-2026-v1.0.0.zip -Algorithm SHA256
$expected = Get-Content agentcamp-madrid-2026-v1.0.0.zip.sha256
if ($hash.Hash -eq ($expected -split ' ')[0]) {
    Write-Host "✅ Checksum válido"
} else {
    Write-Host "❌ Checksum inválido"
}
```

## 🔄 Actualización del CHANGELOG

Antes de crear una release, **actualiza el CHANGELOG.md**:

1. Abre `CHANGELOG.md`
2. Bajo `[Unreleased]`, añade una nueva sección con la versión y fecha:

```markdown
## [1.1.0] - 2026-02-20

### Añadido
- Biografías completas de todos los speakers
- Resúmenes detallados de sesiones

### Modificado
- Actualizada información de horarios
- Mejorados gráficos de branding

### Corregido
- Enlaces rotos a Sessionize
- Typos en la documentación
```

3. Actualiza los enlaces al final del archivo:

```markdown
[1.1.0]: https://github.com/GlobalAISpain/agentcamp-madrid-2026/releases/tag/v1.1.0
[Unreleased]: https://github.com/GlobalAISpain/agentcamp-madrid-2026/compare/v1.1.0...HEAD
```

## 🎯 Checklist Pre-Release

Antes de crear una release, verifica:

- [ ] Todo el contenido está actualizado
- [ ] Los enlaces funcionan correctamente
- [ ] Las imágenes se cargan sin problemas
- [ ] El CHANGELOG.md está actualizado
- [ ] No hay información sensible o privada
- [ ] Los nombres de archivos son consistentes
- [ ] La documentación es clara y completa
- [ ] Los templates están en su última versión

## 🐛 Solución de Problemas

### El workflow falla al crear el release

**Problema**: Error de permisos

**Solución**: Verifica que el workflow tenga permisos de escritura:
- Ve a: `Settings > Actions > General > Workflow permissions`
- Selecciona: "Read and write permissions"
- Guarda los cambios

### No se crean los archivos ZIP/TAR.GZ

**Problema**: Faltan dependencias en el runner

**Solución**: El workflow usa `ubuntu-latest` que incluye todas las herramientas necesarias. Si persiste, revisa los logs del workflow.

### Los checksums no coinciden

**Problema**: El archivo fue modificado después de la descarga

**Solución**: Vuelve a descargar el archivo desde la release oficial.

## 📞 Contacto y Soporte

Si tienes problemas o preguntas sobre las releases:

1. Abre un **Issue** en GitHub
2. Contacta a los organizadores del evento
3. Consulta la documentación oficial en el README

## 🎓 Mejores Prácticas

1. **Releases frecuentes pero significativas**: No hagas releases para cambios triviales
2. **Mensajes descriptivos**: Usa mensajes claros en los tags
3. **Testing pre-release**: Verifica que todo funciona antes de publicar
4. **Comunicación**: Anuncia las nuevas releases a la comunidad
5. **Versionado consistente**: Sigue siempre Semantic Versioning

---

**Happy Releasing! 🚀**

Gracias por contribuir a AgentCamp 2026 Madrid y a la comunidad Global AI.
