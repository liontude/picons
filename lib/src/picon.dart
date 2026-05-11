library picons;

import 'package:flutter/material.dart';
import 'package:picons/picons.dart';

/// A Phosphor icon widget with duotone support.
///
/// Works exactly like [Icon] for non-duotone icons. For duotone icons,
/// renders a two-layer stack using [duoColor] and [duoOpacity].
///
/// Colors resolve in this order:
/// - Explicit value on the widget
/// - [PiconsTheme] from the context
/// - [IconTheme] (Flutter default)
class Picon extends Icon {
  const Picon(
    IconData icon, {
    Key? key,
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    this.duoColor,
    this.duoOpacity,
  }) : super(
          icon,
          color: color,
          fill: fill,
          grade: grade,
          key: key,
          opticalSize: opticalSize,
          semanticLabel: semanticLabel,
          shadows: shadows,
          size: size,
          textDirection: textDirection,
          weight: weight,
        );

  /// Secondary layer color for duotone icons.
  /// Falls back to [PiconsTheme.duoColor], then to the icon's [color].
  final Color? duoColor;

  /// Secondary layer opacity for duotone icons.
  /// Falls back to [PiconsTheme.duoOpacity], then to 0.20.
  final double? duoOpacity;

  @override
  Widget build(BuildContext context) {
    if (icon is PiconDuotoneData) {
      final duotoneIcon = icon as PiconDuotoneData;
      final piconsTheme = Theme.of(context).extension<PiconsTheme>();

      final resolvedColor = color ?? piconsTheme?.color;
      final resolvedDuoColor =
          duoColor ?? piconsTheme?.duoColor ?? resolvedColor;
      final resolvedDuoOpacity = duoOpacity ?? piconsTheme?.duoOpacity ?? 0.20;

      return Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: resolvedDuoOpacity,
            child: Icon(
              duotoneIcon.secondary,
              key: key,
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
            icon,
            key: key,
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
    return super.build(context);
  }
}
