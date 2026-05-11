# picons

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
  duotoneSecondaryColor: Colors.yellow,
  duotoneSecondaryOpacity: 0.5,
)
```

> `Picon` works exactly like the native `Icon` widget for all non-duotone icons.

## Example App

```bash
cd example
flutter pub get
flutter run
```

## License

MIT © [Liontude, LLC](https://github.com/liontude)

This project is a fork of [phosphor-icons/phosphor-flutter](https://github.com/phosphor-icons/phosphor-flutter) by [Phosphor Icons](https://github.com/phosphor-icons), licensed under MIT.
