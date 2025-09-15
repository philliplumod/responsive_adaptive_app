import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dummy_page.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = defaultTargetPlatform;
    return ListView(
      children: [
        ListTile(
          title: const Text('Account'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DummyPage()),
            );
          },
        ),
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
