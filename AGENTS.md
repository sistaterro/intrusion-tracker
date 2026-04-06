# AGENTS.md

## Project Goal

This project is a lightweight HTML-based security event visualizer.

The main goal is to present intrusion events on top of a map with:

- a strong visual identity,
- a readable event timeline,
- a right-hand alert log,
- a detail panel for the selected event,
- a CSV-driven data source that is easy to swap later.

The intended direction is closer to an interactive demo / monitoring concept than to a production SOC tool.

## Current State

The project currently consists of:

- [index.html](./index.html)
- [alerts.csv](./alerts.csv)
- [favicon.ico](./favicon.ico)
- [favicon.png](./favicon.png)
- [README.md](./README.md)

The UI is already functional and includes:

- Leaflet map with custom pulsing markers
- top timeline with numbered events
- adaptive timeline scale labels
- filters by severity and date range
- alert list on the right sidebar
- detail panel for the selected alert
- popup on map click
- auto-load of local CSV plus manual file upload

## Product Direction

The popup is currently the visual source of truth.

This means:

- typography and hierarchy in the popup should guide the rest of the UI
- sidebar cards and detail panel should visually align with the popup style
- timeline should stay simple and avoid dense timestamp text on each point

The interface is intentionally dark, tactical, and high-contrast.

## Important Recent Decisions

### Timeline

The timeline was simplified to reduce clutter:

- event markers display short numeric labels instead of full timestamps
- the time scale is rendered separately, like a ruler
- scale labels currently use a format such as `Oct/2010`
- the scale is adaptive based on visible time span

This area is likely to evolve further.

### Typography

Several typography passes were already made:

- popup text was enlarged and brightened
- sidebar width was increased for readability
- detail panel was adjusted to better match popup hierarchy
- timeline labels were reworked to avoid overlap

### Map Markers

Map points now have:

- brighter cores
- pulse / halo effect

This was done to improve visibility on top of the dark basemap.

## Known Technical Debt

### CSV Format Is Likely Temporary

The current CSV format works for the prototype, but it is likely to change.

Possible future changes:

- rename columns
- normalize timestamps
- separate display labels from raw event data
- remove fields that are only useful for prototyping
- replace CSV entirely with JSON or API-backed data

Any future agent should treat the current CSV schema as provisional.

### Severity Model May Change

There is a strong chance that `critical` will be removed in the future.

Implications:

- current severity filters assume `critical`, `high`, `medium`, `low`
- stats bar and CSS classes are hardcoded around that model
- popup, badges, and counts will need cleanup if `critical` disappears

If this happens, update:

- severity color map
- filter buttons
- stats counters
- badge styles
- any sample CSV rows using `critical`

### Manual CSV Upload May Be Removed

The `Load CSV` button is likely temporary and may be removed later.

Implications:

- `#upload-btn`
- `#file-input`
- file input event listener
- empty-state copy referring to manual upload

If upload is removed, the project should probably rely on one of these:

- auto-loading a local bundled dataset
- loading a fixed external dataset
- loading data from a future backend

### Encoding Problems In Sample Data

The current sample CSV still contains mojibake in several rows, for example broken accented characters.

This is a data quality issue, not only a styling issue.

Future cleanup should normalize the file encoding to UTF-8 and rewrite the affected strings.

### HTML Monolith

Most logic currently lives in a single HTML file with embedded CSS and JavaScript.

This is acceptable for the prototype, but it creates friction for:

- maintainability
- testing
- future feature growth
- collaboration between multiple agents

If the project grows, consider splitting into:

- `styles.css`
- `app.js`
- optional `data/` folder

## Things To Preserve

Future agents should preserve these qualities unless explicitly asked to change them:

- bold dark visual style
- high readability over the map
- popup-first visual hierarchy
- minimal clutter in the timeline
- simple local workflow with no build step

## Suggested Next Improvements

Good next tasks:

- clean the CSV encoding and rewrite corrupted accented text
- make severity categories configurable instead of hardcoded
- decouple the timeline scale from the event marker labels even more cleanly
- simplify or remove manual CSV upload if the product direction is fixed
- move inline styles in popup rendering into CSS classes
- make date formatting locale-aware and internally consistent

## Quick Orientation For Another Agent

If you are picking this up fresh:

1. Start with [index.html](./index.html).
2. Review `renderTimeline()` and `renderTimelineScale()` first.
3. Review `buildPopup()` and `showDetail()` for hierarchy and text styling.
4. Review `loadData()` to understand the current CSV contract.
5. Inspect [alerts.csv](./alerts.csv) before making assumptions about data quality.

## Assumptions

These are current working assumptions, not guaranteed long-term truths:

- this is a prototype/demo
- local files should keep working without a complex setup
- UI clarity matters more than strict density
- the CSV schema is not stable
- the severity model is not stable
