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

Widget circleAvatar({required String imageUrl, required double radius}) {
  return Center(
    child: CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(imageUrl),
    ),
  );
}

Widget buildSectionTitle({required String title, required ThemeData theme}) {
  return Padding(
    padding: AppDecorations.appMargin / 2,
    child: Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      ),
    ),
  );
}

Widget buildKeyValue({
  required String key,
  required String value,
  required ThemeData theme,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: AppDecorations.verticalSpace / 4,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$key: ",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget infoCard({required ThemeData theme, required List<Widget> children}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: AppDecorations.verticalSpace / 2,
      horizontal: AppDecorations.verticalSpace,
    ),
    decoration: BoxDecoration(
      color: theme.colorScheme.primaryContainer,
      borderRadius: AppDecorations.appBorderRadius,
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

Widget listCard({
  required String imageUrl,
  required String title,
  required Function() onTap,
  required ThemeData theme,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(AppDecorations.verticalSpace),
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                  blurRadius: 24,
                ),
                Shadow(
                  color: Colors.black,
                  offset: Offset(-1, -1),
                  blurRadius: 16,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
