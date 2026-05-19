import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'extensions.dart';
import 'style_file_data.dart';
import 'utils.dart';

/// Generated the main class of the package that exposes all the style classes
void generateMainClass(List<StyleFileData> styles) {
  print('Generating style abstract class app_icons.dart file');

  final phosphorLib = Library((libraryBuilder) => libraryBuilder
    ..directives.addAll([
      ...styles.map(
        (style) => Directive.export(
          'package:app_icons/src/${style.classFileName}',
        ),
      ),
      Directive.export(
        'package:app_icons/src/app_icons_base.dart',
      ),
    ]));

  final emitter = DartEmitter();
  final generatedFileContent = DartFormatter().format(
    '${phosphorLib.accept(emitter)}',
  );

  saveContentToFile(
    filePath: '../lib/src/app_icons.dart',
    content: generatedFileContent,
  );
}

/// Generates an abstract class that exposes all the icons that every style extends
void generateBaseClass(List icons) {
  print('Generating app_icons_base.dart file');
  final styles = StyleFileData.values;
  final stylesEnum = Enum(
    (enumBuilder) => enumBuilder
      ..name = 'AppIconsStyle'
      ..values.addAll(
        styles.map(
          (style) => EnumValue((builder) => builder
            ..name = style.styleName
            ..docs.add(style.docsLine)),
        ),
      ),
  );
  final methods = icons.map((icon) => buildBaseFieldIcon(icon)).toList();
  final phosphorIconsClass = Class((classBuilder) {
    classBuilder
      ..name = 'AppIcons'
      ..docs.addAll([
        '/// This class helps to access the icons of all the styles. Use the specific style class to access the icons of that style:',
        ...styles.map((style) => '/// - [${style.className}]'),
      ])
      ..fields.add(Field((b) => b
        ..static = true
        ..name = 'defaultStyle'
        ..type = Reference('AppIconsStyle')
        ..assignment = Code('AppIconsStyle.regular')))
      ..methods.addAll(methods);
  });

  final phosphorLib = Library(
    (libraryBuilder) => libraryBuilder
      ..directives.addAll([
        Directive.import(
          'package:app_icons/src/app_icon_data.dart',
        ),
        ...styles.map(
          (style) => Directive.import(
            'package:app_icons/src/${style.classFileName}',
          ),
        ),
      ])
      ..body.addAll([phosphorIconsClass, stylesEnum]),
  );

  final emitter = DartEmitter();
  final generatedFileContent = DartFormatter().format(
    '${phosphorLib.accept(emitter)}',
  );
  saveContentToFile(
    filePath: '../lib/src/app_icons_base.dart',
    content: generatedFileContent,
  );
}

Method buildBaseFieldIcon(dynamic icon) {
  final properties = icon['properties'] as Map<String, dynamic>;
  final rawName = properties['name'] as String;
  final fullName = rawName.split(",").first;
  final name = formatName(fullName, style: 'regular');
  final styles = StyleFileData.values;
  var code = 'switch (Picons.defaultStyle) {';
  for (final style in styles) {
    final returnExpr = style == StyleFileData.duotone
        ? '${style.className}.$name.primary'
        : '${style.className}.$name';
    code += '''
case PiconsStyle.${style.styleName}:
  return $returnExpr;
''';
  }
  code += '}';
  return Method((methodBuilder) => methodBuilder
    ..name = name
    ..static = true
    ..type = MethodType.getter
    ..docs.addAll(styles.map((style) {
        final suffix = style.styleName == 'regular' ? '' : '-${style.styleName}';
        return '/// ${style.styleName}: ![$fullName](https://raw.githubusercontent.com/phosphor-icons/core/main/assets/${style.styleName}/$fullName$suffix.svg)';
      }))
    ..body = Code(code)
    ..returns = Reference('PiconData'));
}

/// reads the phosphor json  of one style and generates a dart class
/// with all the phosphor icons constants for that style
void generateStyleClass(List icons, {required StyleFileData style}) {
  print('Generating style abstract class ${style.classFileName} file');

  final fields = icons
      // filter only valid graphs by idx of the style
      .where((icon) => icon['setIdx'] as int == style.idx)
      // Generate the field for the graph
      .map((icon) => buildFieldIconByStyle(icon, style: style))
      .toList()
    // sort the element alphabetically
    ..sort(
      (a, b) => a.name.compareTo(b.name),
    );

  final phosphorIconsClass = Class((classBuilder) => classBuilder
    ..abstract = false
    ..name = style.className
    ..fields.addAll(fields)
    ..annotations.add(CodeExpression(Code('staticIconProvider')))
    ..constructors.add(Constructor(
        (constructorBuilder) => constructorBuilder..constant = true)));

  final phosphorLib = Library(
    (libraryBuilder) => libraryBuilder
      ..directives.add(
        Directive.import(
          'package:app_icons/src/app_icon_data.dart',
        ),
      )
      ..directives.add(
        Directive.import(
          'package:flutter/widgets.dart',
        ),
      )
      ..body.add(phosphorIconsClass),
  );

  final emitter = DartEmitter();
  final generatedFileContent = DartFormatter().format(
    '${phosphorLib.accept(emitter)}',
  );
  saveContentToFile(
    filePath: '../lib/src/${style.classFileName}',
    content: generatedFileContent,
  );
}

Field buildFieldIconByStyle(dynamic icon, {required StyleFileData style}) {
  final properties = icon['properties'] as Map<String, dynamic>;
  final fullName = properties['name'] as String;
  final firstName = fullName.split(",").first;
  final name = formatName(firstName, style: style.styleName);

  final svgSuffix = style.styleName == 'regular' ? '' : '-${style.styleName}';
  final iconDocLines = [
    '/// $firstName',
    '///',
    '/// ![$firstName](https://raw.githubusercontent.com/phosphor-icons/core/main/assets/${style.styleName}/$firstName$svgSuffix.svg)',
  ];

  late Code codeStatement;

  if (style == StyleFileData.duotone && properties['codes'] != null) {
    final graphCodes = (properties['codes'] as List).cast<int>();
    final backgroundHexCode = '0x' + graphCodes.first.toRadixString(16);
    final foregroundHexCode = '0x' + graphCodes.last.toRadixString(16);
    codeStatement = Code(
      "PiconDuotoneData(PiconData(IconData($foregroundHexCode, fontFamily: 'PhosphorDuotone', fontPackage: 'picons', matchTextDirection: true)), PiconData(IconData($backgroundHexCode, fontFamily: 'PhosphorDuotone', fontPackage: 'picons', matchTextDirection: true)),)",
    );
  } else {
    final graphCode = properties['code'] as int;
    final hexCode = '0x' + graphCode.toRadixString(16);
    final styleName = style.styleName.capitalize();
    codeStatement = Code(
      "PiconFlatData(IconData($hexCode, fontFamily: 'Phosphor$styleName', fontPackage: 'picons', matchTextDirection: true),)",
    );
  }

  return Field(
    (fieldBuilder) => fieldBuilder
      ..docs.addAll(iconDocLines)
      ..modifier = FieldModifier.constant
      ..static = true
      ..name = name
      ..assignment = codeStatement,
  );
}
