import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = defaultTargetPlatform;
    return ListView(
      children: [
        ListTile(title: const Text('Account')),
        ListTile(title: const Text('Notifications')),
        ListTile(title: const Text('Appearance')),
        ListTile(
          title: Text('Platform hint: $platform'),
          subtitle: const Text('Flutter adapts dialogs, scrolling, and icons.'),
        ),
      ],
    );
  }
}
