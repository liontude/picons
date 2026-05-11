# Picons

1512 icons for Flutter — thin, light, regular, bold, fill, and duotone styles.
Based on [Phosphor Icons](https://phosphoricons.com).

## Installation

```bash
flutter pub add picons
```

## Usage

```dart
import 'package:picons/picons.dart';
```

### Default style

Set a global style once in `main.dart` and access any icon without repeating it:

```dart
Picons.defaultStyle = PiconsStyle.bold;

Icon(Picons.pencil)
Icon(Picons.house)
Icon(Picons.star)
```

### Specific style

Use a style class directly — always explicit, unaffected by `defaultStyle`:

```dart
Icon(PiconsRegular.pencil)
Icon(PiconsFill.pencil)
Icon(PiconsBold.pencil)
Icon(PiconsThin.pencil)
Icon(PiconsLight.pencil)
```

### Duotone

Use `Picon` instead of `Icon` to render the duotone stack:

```dart
// explicit
Picon(PiconsDuotone.pencil)

// via defaultStyle
Picons.defaultStyle = PiconsStyle.duotone;
Picon(Picons.pencil)
```

Custom secondary color:

```dart
Picon(
  PiconsDuotone.pencil,
  color: Colors.blue,
  duoColor: Colors.yellow,
  duoOpacity: 0.5,
)
```

> `Picon` works exactly like the native `Icon` widget for all non-duotone icons.

### Theme integration

Configure duotone defaults globally via `PiconsTheme`:

```dart
MaterialApp(
  theme: ThemeData(
    extensions: [
      PiconsTheme(color: Colors.grey, duoColor: Colors.grey, duoOpacity: 0.2),
    ],
  ),
  darkTheme: ThemeData(
    extensions: [
      PiconsTheme(color: Colors.white, duoColor: Colors.white, duoOpacity: 0.15),
    ],
  ),
)
```

Colors resolve in this order: explicit value on the widget → `PiconsTheme` → `IconTheme`.

## Example App

```bash
cd example
flutter pub get
flutter run
```

## License

MIT © [Liontude, LLC](https://github.com/liontude)

This project is a fork of [phosphor-icons/phosphor-flutter](https://github.com/phosphor-icons/phosphor-flutter) by [Phosphor Icons](https://github.com/phosphor-icons), licensed under MIT.
