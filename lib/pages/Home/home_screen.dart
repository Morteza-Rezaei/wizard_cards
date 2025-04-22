import 'package:flutter/material.dart';
import 'package:wizard_cards/constants/app_decoration.dart';
import 'package:wizard_cards/constants/app_path.dart';
import 'package:wizard_cards/constants/app_text.dart';
import 'package:wizard_cards/widgets.dart/app_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.appMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Logo
              Image.asset(AppPath.logo, width: 180, height: 180),

              const SizedBox(height: AppDecorations.verticalSpace * 2),

              // Hoşgeldin başlık
              Text(
                AppText.welcomeTitle,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppDecorations.verticalSpace),

              // Açıklama metni
              Text(
                AppText.welcomeDescription,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Keşfet butonu
              appPrimaryButton(
                text: AppText.welcomeButton,
                onPressed: () {},
                theme: theme,
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
