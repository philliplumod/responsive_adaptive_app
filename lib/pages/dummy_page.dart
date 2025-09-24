import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          // LayoutBuilder gives the constraints (maxWidth, maxHeight)
          // of the widget, useful for deciding layout based on available space.
          builder: (context, constraints) {
            final width = constraints.maxWidth; // Available width
            final height = constraints.maxHeight; // Available height

            final mediaQuery = MediaQuery.of(context);
            // MediaQuery provides device-level info like screen size,
            // orientation, pixel density, safe areas, etc.
            final isPortrait = mediaQuery.orientation == Orientation.portrait;

            double fontSize;
            EdgeInsets padding;

            // Responsive design: choose font size & padding based on width
            if (width < 600) {
              // Mobile
              fontSize = 18;
              padding = const EdgeInsets.all(16);
            } else if (width < 1200) {
              // Tablet
              fontSize = 28;
              padding = const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 32,
              );
            } else {
              // Desktop
              fontSize = 36;
              padding = const EdgeInsets.symmetric(
                horizontal: 120,
                vertical: 48,
              );
            }

            return Center(
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.devices,
                      size: fontSize * 2,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'This is a responsive page.',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaler: const TextScaler.linear(
                        1.0,
                      ), // ensures scaling
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Screen width: ${width.toStringAsFixed(0)}\n'
                      'Screen height: ${height.toStringAsFixed(0)}\n'
                      'Orientation: ${isPortrait ? "Portrait" : "Landscape"}',
                      style: TextStyle(fontSize: fontSize),
                      textScaler: const TextScaler.linear(
                        0.8,
                      ), // smaller text scaling
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// DummyPage widget: A responsive page that adapts its font size, padding,
// and layout depending on screen width (mobile, tablet, desktop) and orientation.
// Uses TextScaler for consistent and accessible text scaling.
