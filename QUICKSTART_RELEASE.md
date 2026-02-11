# 🚀 Quick Start - Primera Release v1.0.0

¡Bienvenido! Esta guía te ayudará a crear tu primera release del paquete AgentCamp 2026.

## 🎯 Opción 1: Release Automática con GitHub Actions (Recomendada)

### Paso 1: Preparar el Repositorio

1. **Asegúrate de que todo esté actualizado:**
   ```bash
   git add .
   git commit -m "Preparación para release 1.0.0"
   git push origin main
   ```

2. **Verifica los permisos de GitHub Actions:**
   - Ve a: `Settings` → `Actions` → `General`
   - En "Workflow permissions", selecciona: **"Read and write permissions"**
   - Marca: **"Allow GitHub Actions to create and approve pull requests"**
   - Haz clic en **Save**

### Paso 2: Crear la Release

1. **Ve a la pestaña "Actions"** en GitHub
2. Selecciona el workflow **"Create Release Package"**
3. Haz clic en **"Run workflow"** (botón azul)
4. Completa los campos:
   - **Branch**: `main`
   - **Version number**: `1.0.0`
   - **Mark as pre-release**: Deja desmarcado
5. Haz clic en **"Run workflow"**

### Paso 3: Espera y Verifica

1. El workflow tardará ~2-3 minutos
2. Una vez completado, ve a **"Releases"** en GitHub
3. ¡Tu release v1.0.0 estará publicada! 🎉

---

## 🎯 Opción 2: Release Local con Script

### Paso 1: Ejecutar el Script

```bash
# Desde la raíz del repositorio
./scripts/create-release-package.sh 1.0.0
```

### Paso 2: Archivos Generados

El script creará:
- ✅ `agentcamp-madrid-2026-v1.0.0.zip`
- ✅ `agentcamp-madrid-2026-v1.0.0.tar.gz`
- ✅ Checksums SHA256 de ambos archivos

### Paso 3: Crear Release Manualmente en GitHub

1. Ve a la pestaña **"Releases"** en GitHub
2. Haz clic en **"Draft a new release"**
3. Completa:
   - **Tag**: `v1.0.0`
   - **Release title**: `AgentCamp 2026 Madrid - v1.0.0`
   - **Description**: Copia el contenido de `CHANGELOG.md`
4. Arrastra los archivos generados al área de adjuntos
5. Haz clic en **"Publish release"**

---

## ✅ Checklist Pre-Release

Antes de crear la release, verifica:

- [ ] **Contenido actualizado:**
  - [ ] README.md tiene la información correcta
  - [ ] Todos los logos están en `branding/`
  - [ ] Información de speakers actualizada
  - [ ] Sponsors listados correctamente
  - [ ] Templates de PowerPoint finalizados

- [ ] **Documentación:**
  - [ ] CHANGELOG.md actualizado con la versión 1.0.0
  - [ ] LICENSE presente
  - [ ] CODE_OF_CONDUCT.md presente

- [ ] **Enlaces verificados:**
  - [ ] Website funciona: https://www.globalai.es
  - [ ] Sessionize activo: https://agentcamp.sessionize.com
  - [ ] Eventbrite accesible

- [ ] **Calidad:**
  - [ ] No hay typos en documentación
  - [ ] Imágenes se cargan correctamente
  - [ ] Fechas y horarios correctos
  - [ ] Información de ubicaciones actualizada

---

## 🎉 Post-Release

Una vez creada la release:

### 1. Verifica la Descarga

```bash
# Descarga el ZIP
wget https://github.com/GlobalAISpain/agentcamp-madrid-2026/releases/download/v1.0.0/agentcamp-madrid-2026-v1.0.0.zip

# Verifica el checksum
wget https://github.com/GlobalAISpain/agentcamp-madrid-2026/releases/download/v1.0.0/agentcamp-madrid-2026-v1.0.0.zip.sha256
sha256sum -c agentcamp-madrid-2026-v1.0.0.zip.sha256
```

### 2. Extrae y Revisa

```bash
# Extrae el paquete
unzip agentcamp-madrid-2026-v1.0.0.zip

# Revisa el contenido
cd agentcamp-madrid-2026-v1.0.0
ls -la
cat RELEASE_INFO.txt
```

### 3. Actualiza el Badge del README

El badge se actualizará automáticamente para mostrar v1.0.0:

[![Latest Release](https://img.shields.io/github/v/release/GlobalAISpain/agentcamp-madrid-2026?style=for-the-badge&logo=github)](https://github.com/GlobalAISpain/agentcamp-madrid-2026/releases/latest)

### 4. Anuncia la Release

Comparte la release con la comunidad:

```markdown
🎉 ¡Ya disponible el paquete oficial de AgentCamp 2026 Madrid v1.0.0!

📦 Descarga todos los materiales del evento en un solo archivo:
https://github.com/GlobalAISpain/agentcamp-madrid-2026/releases/tag/v1.0.0

Incluye:
✅ Documentación completa
✅ Logos y branding
✅ Información de speakers
✅ Templates de presentación
✅ ¡Y mucho más!

#AgentCamp2026 #GlobalAI #Madrid
```

---

## 🔄 Futuras Releases

Para crear releases posteriores:

### v1.0.1 (Patch - Correcciones)
```bash
# Ejemplo: Corregir typos, actualizar enlaces
./scripts/create-release-package.sh 1.0.1
```

### v1.1.0 (Minor - Nuevas características)
```bash
# Ejemplo: Añadir biografías completas, nuevos materiales
./scripts/create-release-package.sh 1.1.0
```

### v2.0.0 (Major - Cambios importantes)
```bash
# Ejemplo: AgentCamp 2027
./scripts/create-release-package.sh 2.0.0
```

**Recuerda:** Actualiza siempre el `CHANGELOG.md` antes de cada release!

---

## 📚 Recursos Adicionales

- 📖 [Guía completa de Releases](.github/RELEASE_GUIDE.md)
- 📝 [CHANGELOG](CHANGELOG.md)
- 🔧 [Documentación de Scripts](scripts/README.md)
- ⚙️ [GitHub Actions Workflow](.github/workflows/release.yml)

---

## 🆘 Ayuda

¿Problemas creando la release?

1. **Revisa los logs** del workflow en GitHub Actions
2. **Verifica permisos** en Settings → Actions
3. **Consulta** la [guía de solución de problemas](.github/RELEASE_GUIDE.md#-solución-de-problemas)
4. **Abre un issue** en GitHub si el problema persiste

---

## 🎊 ¡Felicidades!

Has completado la configuración de releases para AgentCamp 2026 Madrid.

Ahora tu repositorio está listo para distribuir fácilmente todos los materiales del evento.

**¡Gracias por contribuir a la comunidad Global AI Spain! 🚀**

---

<div align="center">

**Documentación creada con ❤️ por Global AI Community Spain**

[🌐 Website](https://www.globalai.es) | [📅 Agenda](https://agentcamp.sessionize.com) | [🎟️ Entradas](https://www.eventbrite.es/e/entradas-agentcamp-2026-madrid-aka-global-ai-bootcamp-1980480271806)

</div>
