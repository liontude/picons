library app_icons;

import 'package:flutter/widgets.dart';

class AppIconData extends IconData {
  const AppIconData(int codePoint, String style)
      : super(
          codePoint,
          fontFamily: 'Phosphor$style',
          fontPackage: 'app_icons',
          matchTextDirection: true,
        );
}

class AppFlatIconData extends AppIconData {
  const AppFlatIconData(int codePoint, String style)
      : super(codePoint, style);
}

class AppDuotoneIconData extends AppIconData {
  const AppDuotoneIconData(int codePoint, this.secondary)
      : super(codePoint, 'Duotone');

  final AppIconData secondary;
}
