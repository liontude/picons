library picons;

import 'package:flutter/material.dart';

/// Flutter [ThemeExtension] for configuring Picons defaults globally.
///
/// Add to your [ThemeData] to control icon color and duotone appearance
/// without passing parameters on every widget:
///
/// ```dart
/// MaterialApp(
///   theme: ThemeData(
///     extensions: [
///       PiconsTheme(color: Colors.grey, duoColor: Colors.grey, duoOpacity: 0.2),
///     ],
///   ),
///   darkTheme: ThemeData(
///     extensions: [
///       PiconsTheme(color: Colors.white, duoColor: Colors.white, duoOpacity: 0.15),
///     ],
///   ),
/// )
/// ```
class PiconsTheme extends ThemeExtension<PiconsTheme> {
  const PiconsTheme({
    this.color,
    this.duoColor,
    this.duoOpacity,
  });

  /// Default color for all [Picon] widgets.
  /// Falls back to [IconTheme] if not set.
  final Color? color;

  /// Default secondary layer color for duotone icons.
  /// Falls back to the resolved icon color if not set.
  final Color? duoColor;

  /// Default secondary layer opacity for duotone icons.
  /// Falls back to [Picon]'s default of 0.20 if not set.
  final double? duoOpacity;

  @override
  PiconsTheme copyWith({Color? color, Color? duoColor, double? duoOpacity}) {
    return PiconsTheme(
      color: color ?? this.color,
      duoColor: duoColor ?? this.duoColor,
      duoOpacity: duoOpacity ?? this.duoOpacity,
    );
  }

  @override
  PiconsTheme lerp(PiconsTheme? other, double t) {
    if (other == null) return this;
    return PiconsTheme(
      color: Color.lerp(color, other.color, t),
      duoColor: Color.lerp(duoColor, other.duoColor, t),
      duoOpacity: _lerpDouble(duoOpacity, other.duoOpacity, t),
    );
  }

  static double? _lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    return (a ?? b)! + ((b ?? a)! - (a ?? b)!) * t;
  }
}
