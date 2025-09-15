import 'package:flutter/material.dart';
import 'package:responsive_adaptive_app/model/destination.dart';
import 'package:responsive_adaptive_app/pages/gallery_content.dart';
import 'package:responsive_adaptive_app/pages/home_content.dart';
import 'package:responsive_adaptive_app/pages/settings_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  void _openResponsiveDialog() {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 800) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: AlertDialog(
              title: Text('Responsive Dialog'),
              content: Text('This dialog is constrained on large screens'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Closed'),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      showGeneralDialog(
        context: context,
        pageBuilder: (context, a1, a2) => Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Text('This is a fullscreen dialog used for narrow windows'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final bool useRail = width >= 600;

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Adaptive Demo ${_destinations[_selectedIndex].label}',
              ),
            ),

            body: Row(
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
            bottomNavigationBar: useRail
                ? null
                : NavigationBar(
                    destinations: _destinations
                        .map(
                          (d) => NavigationDestination(
                            icon: Icon(d.icon),
                            label: d.label,
                          ),
                        )
                        .toList(),
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (i) =>
                        setState(() => _selectedIndex = i),
                  ),
          ),
        );
      },
    );
  }
}
