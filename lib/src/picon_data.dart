library picons;

import 'package:flutter/widgets.dart';

class PiconData extends IconData {
  const PiconData(int codePoint, String style)
      : super(
          codePoint,
          fontFamily: 'Phosphor$style',
          fontPackage: 'picons',
          matchTextDirection: true,
        );
}

class PiconFlatData extends PiconData {
  const PiconFlatData(int codePoint, String style)
      : super(codePoint, style);
}

class PiconDuotoneData extends PiconData {
  const PiconDuotoneData(int codePoint, this.secondary)
      : super(codePoint, 'Duotone');

  final PiconData secondary;
}
