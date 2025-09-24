import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_app/pages/dummy_page.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = defaultTargetPlatform;
    return ListView(
      children: [
        ListTile(
          title: Text(
            'Account',
            style: Theme.of(context).textTheme.titleMedium!,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DummyPage()),
            );
          },
        ),
        ListTile(
          title: Text(
            'Notifications',
            style: Theme.of(context).textTheme.titleMedium!,
          ),
        ),
        ListTile(
          title: Text(
            'Appearance',
            style: Theme.of(context).textTheme.titleMedium!,
          ),
        ),
        ListTile(
          title: Text(
            'Platform hint: $platform',
            style: Theme.of(context).textTheme.titleMedium!,
          ),
          subtitle: Text(
            'Flutter adapts dialogs, scrolling, and icons.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
