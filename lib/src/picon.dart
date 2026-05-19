library picons;

import 'package:flutter/material.dart';
import 'package:picons/picons.dart';

/// Phosphor icon widget with duotone support.
///
/// Works exactly like [Icon] for non-duotone icons. For duotone icons,
/// renders a two-layer stack using [duoColor] and [duoOpacity].
///
/// Colors resolve in this order:
/// - Explicit value on the widget
/// - [PiconsTheme] from the context
/// - [IconTheme] (Flutter default)
class Picon extends StatelessWidget {
  const Picon(
    this.icon, {
    super.key,
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
    this.duoColor,
    this.duoOpacity,
  });

  final Object icon;
  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;

  /// Secondary layer color for duotone icons.
  /// Falls back to [PiconsTheme.duoColor], then to the icon's [color].
  final Color? duoColor;

  /// Secondary layer opacity for duotone icons.
  /// Falls back to [PiconsTheme.duoOpacity], then to 0.20.
  final double? duoOpacity;

  @override
  Widget build(BuildContext context) {
    final piconsTheme = Theme.of(context).extension<PiconsTheme>();

    if (icon is PiconDuotoneData) {
      final duotoneIcon = icon as PiconDuotoneData;
      final resolvedColor = color ?? piconsTheme?.color;
      final resolvedDuoColor = duoColor ?? piconsTheme?.duoColor ?? resolvedColor;
      final resolvedDuoOpacity = duoOpacity ?? piconsTheme?.duoOpacity ?? 0.20;

      return Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: resolvedDuoOpacity,
            child: Icon(
              duotoneIcon.secondary,
              size: size,
              fill: fill,
              weight: weight,
              grade: grade,
              opticalSize: opticalSize,
              color: resolvedDuoColor,
              shadows: shadows,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
            ),
          ),
          Icon(
            duotoneIcon.primary,
            size: size,
            fill: fill,
            weight: weight,
            grade: grade,
            opticalSize: opticalSize,
            color: resolvedColor,
            shadows: shadows,
            semanticLabel: semanticLabel,
            textDirection: textDirection,
          ),
        ],
      );
    }

    return Icon(
      icon as IconData,
      size: size,
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      color: color ?? piconsTheme?.color,
      shadows: shadows,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
