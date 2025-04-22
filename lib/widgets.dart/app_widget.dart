// app primary button
import 'package:flutter/material.dart';
import 'package:wizard_cards/constants/app_decoration.dart';

Widget appPrimaryButton({
  required String text,
  required Function() onPressed,
  required ThemeData theme,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      backgroundColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: AppDecorations.appBorderRadiusCircle,
      ),
    ),
    child: Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
