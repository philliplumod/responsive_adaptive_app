import 'package:flutter/material.dart';

class GalleryContent extends StatelessWidget {
  const GalleryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final maxItemWidth = 240.0;
    final crossAxisCount = (width / maxItemWidth).floor().clamp(1, 6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gallery', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 50,
            itemBuilder: (context, index) => GridTile(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                ),
                child: Text('Item ${index + 1}'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
