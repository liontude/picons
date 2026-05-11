# CHANGELOG

## [1.0.0] - 2026-05-11

Initial release as `app_icons`, forked from [phosphor-icons/phosphor-flutter](https://github.com/phosphor-icons/phosphor-flutter) v2.1.0.

### Changes from upstream

- Renamed all public classes: `Phosphor*` → `App*` (`PhosphorIcon` → `AppIcon`, `PhosphorIconsFill` → `AppIconsFill`, etc.)
- Renamed package from `phosphor_flutter` to `app_icons`
- `AppIcons` icons are now static getters instead of methods — access icons without parentheses (`AppIcons.pencil` instead of `AppIcons.pencil()`)
- Added `AppIcons.defaultStyle` — configure the icon style globally once instead of passing it on every call
- Font family names and font files retain their original Phosphor names (no asset changes)
- Example app migrated to Flutter 3.41.9 project structure (Kotlin DSL, Gradle 8.14, AGP 8.11.1)
