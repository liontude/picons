import 'package:flutter/material.dart';
import 'package:app_icons/app_icons.dart';

import 'constants/all_icons.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Icons Demo',
      home: IconsCatalog(),
    );
  }
}

class IconsCatalog extends StatefulWidget {
  const IconsCatalog({super.key});

  @override
  State<IconsCatalog> createState() => _IconsCatalogState();
}

class _IconsCatalogState extends State<IconsCatalog> {
  late List<AppIconData> _icons;
  late List<String> _iconsNames;
  String _title = 'Icons Catalog - regular';

  @override
  void initState() {
    _icons = AllIcons.regularIcons.values.toList();
    _iconsNames = AllIcons.regularIcons.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/phosphor-mark-tight-yellow.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff35313d),
        actions: [
          PopupMenuButton<AppIconsStyle>(
            tooltip: 'Style',
            icon: Icon(AppIcons.pencilLine(AppIconsStyle.regular)),
            itemBuilder: (context) => AppIconsStyle.values
                .map((style) => PopupMenuItem<AppIconsStyle>(
                      value: style,
                      child: Row(
                        children: [
                          AppIcon(
                            AppIcons.pencilLine(style),
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(style.name),
                        ],
                      ),
                    ))
                .toList(),
            onSelected: (value) {
              final (icons, names) = switch (value) {
                AppIconsStyle.regular => (
                    AllIcons.regularIcons.values.toList(),
                    AllIcons.regularIcons.keys.toList()
                  ),
                AppIconsStyle.thin => (
                    AllIcons.thinIcons.values.toList(),
                    AllIcons.thinIcons.keys.toList()
                  ),
                AppIconsStyle.light => (
                    AllIcons.lightIcons.values.toList(),
                    AllIcons.lightIcons.keys.toList()
                  ),
                AppIconsStyle.bold => (
                    AllIcons.boldIcons.values.toList(),
                    AllIcons.boldIcons.keys.toList()
                  ),
                AppIconsStyle.fill => (
                    AllIcons.fillIcons.values.toList(),
                    AllIcons.fillIcons.keys.toList()
                  ),
                AppIconsStyle.duotone => (
                    AllIcons.duotoneIcons.values.toList(),
                    AllIcons.duotoneIcons.keys.toList()
                  ),
              };

              setState(() {
                _icons = icons;
                _iconsNames = names;
                _title = 'Icons Catalog - ${value.name}';
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        shrinkWrap: true,
        primary: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon(
                  _icons[index],
                  size: 48,
                ),
                Text(
                  _iconsNames[index],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
