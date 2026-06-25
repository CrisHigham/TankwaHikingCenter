# CLAUDE.md

## Project
Flutter application for Tankwa Hiking Center (THC). Entry point: `lib/main.dart`.

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
