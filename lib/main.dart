import 'package:flutter/material.dart';
import 'package:responsive_adaptive_app/pages/homepage.dart';
import 'package:responsive_adaptive_app/utils/text_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(
        onThemeToggle: toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
        textTheme: lightTextTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromARGB(86, 80, 14, 171),
        textTheme: darkTextTheme,
      ),
      themeMode: _themeMode,
    );
  }
}
