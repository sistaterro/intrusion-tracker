# Intrusion Alert Tracker

Visualizador HTML de alertas de intrusión con mapa, timeline y panel lateral de detalle.

## Qué hace

Este proyecto muestra eventos de seguridad geolocalizados a partir de un archivo CSV.

La interfaz incluye:

- Mapa interactivo con marcadores pulsantes.
- Timeline superior con puntos numerados y escala temporal.
- Lista lateral de alertas.
- Panel de detalle para el evento seleccionado.
- Carga automática del CSV local y carga manual desde archivo.

## Archivos principales

- [index.html](./index.html): aplicación principal.
- [alerts.csv](./alerts.csv): dataset de ejemplo.
- [run.bat](./run.bat): utilidad local para ejecutar el proyecto, si corresponde a tu entorno.

## Formato del CSV

El archivo debe incluir estas columnas:

- `id`
- `timestamp`
- `ip`
- `lat`
- `lon`
- `city`
- `country`
- `severity`
- `subject`
- `description`

Ejemplo:

```csv
id,timestamp,ip,lat,lon,city,country,severity,subject,description
1,2024-03-10T07:12:33Z,190.210.45.88,-34.5792,-58.5536,Buenos Aires,AR,high,Login fallido repetido,Multiples intentos de autenticacion SSH
```

## Cómo usarlo

1. Abrí [index.html](./index.html) en el navegador.
2. Si el navegador permite `fetch` local en tu entorno, el archivo [alerts.csv](./alerts.csv) se carga automáticamente.
3. Si no se carga solo, usá el botón `Load CSV` para seleccionar un archivo manualmente.

## Funcionalidades

- Filtros por severidad.
- Filtro por rango de fechas.
- Selección sincronizada entre mapa, timeline y lista.
- Popup en mapa con datos del evento.
- Timeline con escala temporal simplificada.

## Personalización rápida

En [index.html](./index.html):

- Colores base: bloque `:root`.
- Tipografía de la escala temporal: `.tl-scale-label`.
- Tipografía de etiquetas de eventos en timeline: `.tl-label`.
- Estilo del popup del mapa: `.custom-popup`, `.popup-content`.
- Ancho del panel lateral: `#sidebar`.
- Render de la escala temporal: `renderTimelineScale(...)`.
- Render de eventos en timeline: `renderTimeline()`.

## Notas

- El proyecto usa `Leaflet` para el mapa.
- El parsing del CSV se hace con `PapaParse`.
- Parte del contenido del CSV de ejemplo todavía puede requerir limpieza de acentos si fue guardado con codificación incorrecta.
