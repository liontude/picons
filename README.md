# app_icons

772 icons for Flutter — thin, light, regular, bold, fill, and duotone styles.
Based on [Phosphor Icons](https://phosphoricons.com).

## Installation

```yaml
dependencies:
  app_icons:
    git:
      url: https://github.com/liontude/app-icons.git
```

```bash
flutter pub get
```

## Usage

### Default style

Set a global style once and access any icon without repeating it:

```dart
import 'package:app_icons/app_icons.dart';

AppIcons.defaultStyle = AppIconsStyle.regular; // default

Icon(AppIcons.pencil)   // uses defaultStyle
Icon(AppIcons.house)
Icon(AppIcons.star)
```

### Specific style

Use the style class directly — always explicit, unaffected by `defaultStyle`:

```dart
Icon(AppIconsRegular.pencil)
Icon(AppIconsFill.pencil)
Icon(AppIconsBold.pencil)
Icon(AppIconsThin.pencil)
Icon(AppIconsLight.pencil)
```

### Duotone

Use `AppIcon` instead of `Icon` to get secondary color support:

```dart
AppIcon(AppIconsDuotone.pencil)

// custom colors
AppIcon(
  AppIconsDuotone.pencil,
  color: Colors.blue,
  duotoneSecondaryColor: Colors.yellow,
  duotoneSecondaryOpacity: 0.5,
)
```

> `AppIcon` works exactly like the native `Icon` widget for all non-duotone icons too.

### Available styles

| Class | Usage |
|---|---|
| `AppIconsRegular` | `AppIconsRegular.pencil` |
| `AppIconsThin` | `AppIconsThin.pencil` |
| `AppIconsLight` | `AppIconsLight.pencil` |
| `AppIconsBold` | `AppIconsBold.pencil` |
| `AppIconsFill` | `AppIconsFill.pencil` |
| `AppIconsDuotone` | `AppIconsDuotone.pencil` |

## Example App

```bash
cd example
flutter pub get
flutter run
```

## License

MIT © [Liontude, LLC](https://github.com/liontude)

This project is a fork of [phosphor-icons/phosphor-flutter](https://github.com/phosphor-icons/phosphor-flutter) by [Phosphor Icons](https://github.com/phosphor-icons), licensed under MIT.
