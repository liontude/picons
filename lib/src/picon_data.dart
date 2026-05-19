library picons;

import 'package:flutter/widgets.dart';

/// Accepted type for [Picon.icon]. Values should be [PiconData] or
/// [PiconDuotoneData]. Typed as Object because Dart's type system cannot
/// express a sealed union between an extension type and a regular class.
typedef PiconIconData = Object;

/// Extension type over IconData: zero overhead, zero API break for any
/// code that uses PiconData where IconData is expected.
extension type const PiconData(IconData _) implements IconData {}

/// Alias kept for backwards compatibility — was an empty subclass of PiconData.
typedef PiconFlatData = PiconData;

/// Duotone icon: primary layer + secondary layer.
/// No longer an IconData — only works with the Picon widget.
class PiconDuotoneData {
  const PiconDuotoneData(this.primary, this.secondary);

  final PiconData primary;
  final PiconData secondary;
}
