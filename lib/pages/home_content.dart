import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaler;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'This sample demonstrates responsive vs adaptive design.',
          textScaler: textScale,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
