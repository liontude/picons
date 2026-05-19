# CHANGELOG

## [3.0.0] - 2026-05-19

- **Fix (breaking)**: Dart 3.12 / Flutter 3.44 makes `IconData` a `final` class.
  `PiconData` and `PiconFlatData` are now extension types implementing `IconData`
  — zero API break for regular icon usage.
- **Breaking**: `PiconDuotoneData` no longer extends `IconData`. Its constructor
  changes from `PiconDuotoneData(int, PiconData)` to
  `PiconDuotoneData(PiconData, PiconData)`. Use `Picon()` widget (not `Icon()`)
  with duotone icons.
- **Breaking**: `Picon` widget no longer extends `Icon`. It is now a
  `StatelessWidget` with the same visual API.
- **Behavior change**: `Picons.x` with `defaultStyle = duotone` now returns the
  primary layer as `PiconData` instead of `PiconDuotoneData`. For full duotone
  rendering use `PiconsDuotone.x` directly.
- Fix: dartdoc SVG image URLs updated to current Phosphor asset naming convention
  (`{name}-{style}.svg`).
- Require Flutter >=3.44.0, Dart >=3.12.0.

## [2.1.1] - 2026-05-11

- Add demo screenshot to README

## [2.1.0] - 2026-05-11

### New

- `PiconsTheme` — Flutter `ThemeExtension` to configure icon defaults globally, with dark/light theme support
- `Picon.color` now falls back to `PiconsTheme.color` before `IconTheme`
- Duotone color cascade: explicit → `PiconsTheme.duoColor` → icon color

### Breaking changes

- `Picon.duotoneSecondaryColor` renamed to `duoColor`
- `Picon.duotoneSecondaryOpacity` renamed to `duoOpacity` (default remains 0.20)

## [2.0.3] - 2026-05-11

- Add text descriptions to all icon dartdoc comments — pub.dev score now 160/160
- Rewrite CONTRIBUTING.md: open to icon and code contributions, Figma style reference
- Update generator to produce correct dartdoc format for future regenerations

## [2.0.2] - 2026-05-11

- Update repository URL to github.com/liontude/picons

## [2.0.1] - 2026-05-11

- Fix `fontPackage` reference (was `app_icons`, now `picons`) — icons were not rendering
- Correct icon count to 1512 in description and example

## [2.0.0] - 2026-05-11

Renamed package from `app_icons` to `picons` and renamed all public API classes.

### Breaking changes

- Package name: `app_icons` → `picons`
- `AppIcon` → `Picon`
- `AppIcons` → `Picons`
- `AppIconsStyle` → `PiconsStyle`
- `AppIconData` → `PiconData`
- `AppIconsRegular` → `PiconsRegular`
- `AppIconsBold` → `PiconsBold`
- `AppIconsFill` → `PiconsFill`
- `AppIconsThin` → `PiconsThin`
- `AppIconsLight` → `PiconsLight`
- `AppIconsDuotone` → `PiconsDuotone`
- Import: `package:app_icons/app_icons.dart` → `package:picons/picons.dart`

### Other changes

- Example app redesigned: dark theme, search bar, style chips, adaptive grid

## [1.0.0] - 2026-05-11

Initial release as `app_icons`, forked from [phosphor-icons/phosphor-flutter](https://github.com/phosphor-icons/phosphor-flutter) v2.1.0.

### Changes from upstream

- Renamed all public classes: `Phosphor*` → `App*` (`PhosphorIcon` → `AppIcon`, `PhosphorIconsFill` → `AppIconsFill`, etc.)
- Renamed package from `phosphor_flutter` to `app_icons`
- `AppIcons` icons are now static getters instead of methods — access icons without parentheses (`AppIcons.pencil` instead of `AppIcons.pencil()`)
- Added `AppIcons.defaultStyle` — configure the icon style globally once instead of passing it on every call
- Font family names and font files retain their original Phosphor names (no asset changes)
- Example app migrated to Flutter 3.41.9 project structure (Kotlin DSL, Gradle 8.14, AGP 8.11.1)
