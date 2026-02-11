# Configuración del Agente AI - AgentCamp Madrid 2026

Este repositorio está configurado para trabajar con un agente AI avanzado usando **GitHub Copilot en VS Code** con **Model Context Protocol (MCP)**.

## 🤖 Servidores MCP Configurados

El archivo `mcp.json` configura los siguientes servidores MCP para potenciar las capacidades del agente:

### 1. **Filesystem MCP**
- **Propósito**: Acceso inteligente al sistema de archivos
- **Uso**: Navegación del workspace, lectura de archivos, patrones de proyecto

### 2. **GitHub MCP**
- **Propósito**: Integración con GitHub
- **Uso**: 
  - Gestión de issues y PRs
  - Acceso a repositorios
  - Workflows de GitHub Actions
  - Documentación automática

### 3. **Brave Search MCP**
- **Propósito**: Búsqueda web en tiempo real
- **Uso**:
  - Investigación de tecnologías AI/ML
  - Best practices de la comunidad
  - Benchmarks y comparativas
  - Documentación actualizada

### 4. **Memory MCP**
- **Propósito**: Contexto persistente entre sesiones
- **Uso**:
  - Recordar decisiones previas
  - Tracking de convenciones del proyecto
  - Historial de interacciones importantes

## 🚀 Cómo Usar el Agente

### Prerequisitos

1. **VS Code** con la extensión **GitHub Copilot**
2. **Node.js** instalado (para los servidores MCP)
3. **GitHub Copilot** activo y con acceso a Copilot Chat

### Activación

1. Abre este repositorio en VS Code:
   ```bash
   code /ruta/a/agentcamp-madrid-2026
   ```

2. Los servidores MCP se cargarán automáticamente desde `mcp.json`

3. Usa **Copilot Chat** para interactuar con el agente:
   - Presiona `Ctrl+Shift+I` (o `Cmd+Shift+I` en Mac)
   - O usa el ícono de chat en la barra lateral

### Ejemplos de Uso

#### 📝 Gestión de Contenido del Evento

```
"Crea una página de speakers con los 5 speakers confirmados 
incluyendo sus bios y temas de charla"
```

#### 📊 Análisis y Reportes

```
"Analiza el README y sugiere mejoras para hacerlo más atractivo
para potential sponsors"
```

#### 🔍 Investigación

```
"Busca los últimos frameworks de agentes AI lanzados en 2026
y actualiza la sección de temas del README"
```

#### 🐛 Gestión de Issues

```
"Revisa los issues abiertos en el repo y prioriza los 5 más
importantes para la próxima semana"
```

## 🎯 Modos de Agente Disponibles

El agente puede operar en diferentes modos según tus necesidades:

### Event Organizer Mode
- Gestión de speakers y sponsors
- Actualización de agenda y contenidos
- Coordinación de comunicaciones
- Tracking de tareas y deadlines

### Content Creator Mode  
- Creación de posts para blog
- Draft de newsletters
- Social media content
- Materiales promocionales

### Technical Support Mode
- Setup de infraestructura (website, forms, etc.)
- Troubleshooting de problemas técnicos
- Automatización de workflows
- Integración de herramientas

## 📁 Estructura de Trabajo

El agente entiende la estructura del repositorio:

```
agentcamp-madrid-2026/
├── speakers/       # Información y recursos para speakers
├── sponsors/       # Paquetes y contacto de sponsors
├── templates/      # Plantillas para presentaciones y más
├── assets/         # Recursos visuales
└── mcp.json       # Configuración del agente (no modificar)
```

## 🔧 Troubleshooting

### El agente no responde correctamente

1. Verifica que estás en el directorio correcto:
   ```bash
   pwd
   # Debe mostrar: .../agentcamp-madrid-2026
   ```

2. Recarga VS Code: `Ctrl+Shift+P` → "Reload Window"

3. Verifica que `mcp.json` existe y es válido

### Los servidores MCP no se cargan

1. Asegúrate de tener Node.js instalado:
   ```bash
   node --version
   ```

2. Revisa la consola de VS Code: `View` → `Output` → Selecciona "GitHub Copilot Chat"

## 💡 Tips para Mejores Resultados

1. **Sé específico**: "Crea un template de CFP con campos X, Y, Z" es mejor que "ayúdame con CFP"

2. **Da contexto**: Menciona si algo es para speakers, sponsors, o público general

3. **Iteración**: Pide mejoras incrementales en lugar de todo a la vez

4. **Usa el historial**: El agente tiene memoria de conversaciones previas

5. **Archivos relevantes**: Menciona archivos específicos cuando sea relevante

## 🤝 Contribuir

Si mejoras la configuración del agente o descubres nuevos casos de uso, documéntalos aquí.

## 📚 Recursos

- [GitHub Copilot Docs](https://docs.github.com/copilot)
- [Model Context Protocol](https://modelcontextprotocol.io/)
- [VS Code AI Extensions](https://code.visualstudio.com/docs/editor/artificial-intelligence)

---

**¡El agente está listo para ayudarte a organizar un AgentCamp Madrid increíble!** 🚀
