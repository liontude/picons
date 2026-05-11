# app_icons

772 icons for Flutter — thin, light, regular, bold, fill, and duotone styles.
Based on [Phosphor Icons](https://phosphoricons.com).

## Installation

```bash
flutter pub add app_icons
```

## Usage

```dart
import 'package:app_icons/app_icons.dart';
```

### Default style

Set a global style once in `main.dart` and access any icon without repeating it:

```dart
AppIcons.defaultStyle = AppIconsStyle.bold;

Icon(AppIcons.pencil)
Icon(AppIcons.house)
Icon(AppIcons.star)
```

### Specific style

Use a style class directly — always explicit, unaffected by `defaultStyle`:

```dart
Icon(AppIconsRegular.pencil)
Icon(AppIconsFill.pencil)
Icon(AppIconsBold.pencil)
Icon(AppIconsThin.pencil)
Icon(AppIconsLight.pencil)
```

### Duotone

Use `AppIcon` instead of `Icon` to render the duotone stack:

```dart
// explicit
AppIcon(AppIconsDuotone.pencil)

// via defaultStyle
AppIcons.defaultStyle = AppIconsStyle.duotone;
AppIcon(AppIcons.pencil)
```

Custom secondary color:

```dart
AppIcon(
  AppIconsDuotone.pencil,
  color: Colors.blue,
  duotoneSecondaryColor: Colors.yellow,
  duotoneSecondaryOpacity: 0.5,
)
```

> `AppIcon` works exactly like the native `Icon` widget for all non-duotone icons.

## Example App

```bash
cd example
flutter pub get
flutter run
```

## License

MIT © [Liontude, LLC](https://github.com/liontude)

This project is a fork of [phosphor-icons/phosphor-flutter](https://github.com/phosphor-icons/phosphor-flutter) by [Phosphor Icons](https://github.com/phosphor-icons), licensed under MIT.
