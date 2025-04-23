import 'package:flutter/material.dart';
import 'package:wizard_cards/constants/app_decoration.dart';
import 'package:wizard_cards/constants/app_path.dart';
import 'package:wizard_cards/constants/app_text.dart';
import 'package:wizard_cards/pages/Category/category_screen.dart';
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                Image.asset(AppPath.logo, width: 180, height: 180),

                const SizedBox(height: AppDecorations.verticalSpace * 2),

                Text(
                  AppText.welcomeTitle,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppDecorations.verticalSpace),

                Text(
                  AppText.welcomeDescription,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(),

                appPrimaryButton(
                  text: AppText.welcomeButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoryScreen(),
                      ),
                    );
                  },
                  theme: theme,
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
