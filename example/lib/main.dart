import 'package:flutter/material.dart';
import 'package:app_icons/app_icons.dart';

import 'constants/all_icons.dart';

void main() => runApp(const _MyApp());

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Icons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD93D),
          brightness: Brightness.dark,
          surface: const Color(0xFF35313D),
        ),
        scaffoldBackgroundColor: const Color(0xFF2A2733),
        useMaterial3: true,
      ),
      home: const IconsCatalog(),
    );
  }
}

class IconsCatalog extends StatefulWidget {
  const IconsCatalog({super.key});

  @override
  State<IconsCatalog> createState() => _IconsCatalogState();
}

class _IconsCatalogState extends State<IconsCatalog> {
  AppIconsStyle _style = AppIconsStyle.regular;
  String _query = '';
  final _searchController = TextEditingController();

  Map<String, AppIconData> get _currentIcons => switch (_style) {
        AppIconsStyle.regular => AllIcons.regularIcons,
        AppIconsStyle.thin => AllIcons.thinIcons,
        AppIconsStyle.light => AllIcons.lightIcons,
        AppIconsStyle.bold => AllIcons.boldIcons,
        AppIconsStyle.fill => AllIcons.fillIcons,
        AppIconsStyle.duotone => AllIcons.duotoneIcons,
      };

  Map<String, AppIconData> get _filtered {
    if (_query.isEmpty) return _currentIcons;
    return Map.fromEntries(
      _currentIcons.entries.where((e) => e.key.contains(_query)),
    );
  }

  void _selectStyle(AppIconsStyle style) {
    _searchController.clear();
    setState(() {
      _style = style;
      _query = '';
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1B26),
        toolbarHeight: 60,
        title: Row(
          children: [
            Image.asset(
              'assets/images/phosphor-mark-tight-yellow.png',
              height: 32,
              width: 32,
            ),
            const SizedBox(width: 12),
            const Text(
              'App Icons',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v.toLowerCase()),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search 772 icons...',
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon: const Icon(AppIconsRegular.magnifyingGlass, color: Colors.white38),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(AppIconsRegular.x, color: Colors.white38),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFF35313D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: AppIconsStyle.values.map((style) {
                final selected = style == _style;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(style.name),
                    selected: selected,
                    onSelected: (_) => _selectStyle(style),
                    selectedColor: const Color(0xFFFFD93D),
                    labelStyle: TextStyle(
                      color: selected ? const Color(0xFF1E1B26) : Colors.white60,
                      fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 13,
                    ),
                    checkmarkColor: const Color(0xFF1E1B26),
                    backgroundColor: const Color(0xFF35313D),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              '${filtered.length} icons',
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.white24),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppIcon(
                          AppIconsRegular.magnifyingGlass,
                          size: 48,
                          color: Colors.white24,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No icons match "$_query"',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(1),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 110,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final name = filtered.keys.elementAt(index);
                      final icon = filtered.values.elementAt(index);
                      return _IconCell(icon: icon, name: name, style: _style);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _IconCell extends StatelessWidget {
  const _IconCell({
    required this.icon,
    required this.name,
    required this.style,
  });

  final AppIconData icon;
  final String name;
  final AppIconsStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF35313D),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 9.5,
                color: Colors.white38,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
