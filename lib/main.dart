import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_cards/bloc/character_bloc/character_bloc.dart';
import 'package:wizard_cards/bloc/character_bloc/character_event.dart';
import 'package:wizard_cards/bloc/spell_bloc/spell_bloc.dart';
import 'package:wizard_cards/bloc/spell_bloc/spell_event.dart';
import 'theme/app_theme.dart';
import 'pages/Home/home_screen.dart';

void main() {
  runApp(const WizardCardsApp());
}

class WizardCardsApp extends StatelessWidget {
  const WizardCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CharacterBloc()..add(FetchCharacters())),
        BlocProvider(create: (_) => SpellBloc()..add(FetchSpells())),
      ],
      child: MaterialApp(
        title: 'WizardCards',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
