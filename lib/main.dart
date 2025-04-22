import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/Home/home_screen.dart';

void main() {
  runApp(const WizardCardsApp());
}

class WizardCardsApp extends StatelessWidget {
  const WizardCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WizardCards',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
