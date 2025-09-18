import 'package:flutter/material.dart';
import 'package:responsive_adaptive_app/contents/gallery_content.dart';
import 'package:responsive_adaptive_app/contents/home_content.dart';
import 'package:responsive_adaptive_app/contents/settings_gallery.dart';
import 'package:responsive_adaptive_app/model/destination.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Destination> _destinations = [
    Destination(icon: Icons.home, label: 'Home', content: HomeContent()),
    Destination(icon: Icons.image, label: 'Gallery', content: GalleryContent()),
    Destination(
      icon: Icons.settings,
      label: 'Settings',
      content: SettingsContent(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final bool useRail = width >= 600;
        return Scaffold(
          appBar: AppBar(
            title: Text('Adaptive Demo ${_destinations[_selectedIndex].label}'),
          ),
          body: SafeArea(
            child: Row(
              children: [
                if (useRail)
                  NavigationRail(
                    destinations: _destinations
                        .map(
                          (d) => NavigationRailDestination(
                            icon: Icon(d.icon),
                            label: Text(d.label),
                          ),
                        )
                        .toList(),
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (i) =>
                        setState(() => _selectedIndex = i),
                    labelType: NavigationRailLabelType.all,
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: _destinations[_selectedIndex].content,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            destinations: _destinations
                .map(
                  (d) =>
                      NavigationDestination(icon: Icon(d.icon), label: d.label),
                )
                .toList(),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (i) => setState(() => _selectedIndex = i),
          ),
        );
      },
    );
  }
}
