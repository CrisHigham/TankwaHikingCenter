# CLAUDE.md

## Project
Flutter application for Tankwa Hiking Center (THC). Entry point: `lib/main.dart`.

## Architecture

**Target:** Android-first offline mobile app (iOS planned). No web target.

**Stack:**
- **MapLibre** (`maplibre_gl`) — map rendering engine. Do not replace with flutter_map.
- **MBTiles** — pre-packaged offline vector/raster tile database for the fixed geographic area (Tankwa Karoo region).
- **GeoJSON routes** — hiking routes converted from GPX at build time (not at runtime) and embedded as app assets.
- **SQLite** — points of interest (POIs) and user-generated data.
- **GPS sensor** — live location tracking.

**Key constraint:** fully offline after installation. No runtime tile fetching, no internet dependency, no runtime GPX import.

**Build-time data pipeline (developer machine only):**
```
GPX files → conversion script → GeoJSON + MBTiles + POI data → bundled into app assets
```

See `plan/plan.md` for the full architecture document.

## Rules

### README
Every code change that affects application functionality must be reflected in `README.md`. Keep the README accurate — it describes what the app does, not how it is built.

### Tests
All code must be covered by tests in `test/`. Every code change must either:
- Add tests covering the new behaviour, or
- Update existing tests if behaviour changed.

Run tests with:
```
flutter test
```

No code change is complete without passing tests.

### Git staging
All new files that are an integral part of the app must be staged with `git add` as part of the change. Do not leave new app files untracked.
