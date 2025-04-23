import 'package:flutter/material.dart';
import 'package:wizard_cards/constants/app_decoration.dart';
import 'package:wizard_cards/models/category_model.dart';
import 'package:wizard_cards/pages/AllCharacter/all_character_screen.dart';
import 'package:wizard_cards/pages/AppSpell/all_spell_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Choose a Category"), centerTitle: true),
      body: GridView.builder(
        padding: AppDecorations.appMargin,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDecorations.verticalSpace,
          crossAxisSpacing: AppDecorations.verticalSpace,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              if (category.title == "All Characters") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCharacter(title: category.title),
                  ),
                );
              } else if (category.title == "Hogwarts Students") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AllCharacter(
                          title: category.title,

                          showOnlyStudents: true,
                        ),
                  ),
                );
              } else if (category.title == "School Staff") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AllCharacter(
                          title: category.title,
                          showOnlyStaff: true,
                        ),
                  ),
                );
              } else if (category.title == "Spells & Charms") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllSpellScreen(),
                  ),
                );
              }
            },

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(category.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(AppDecorations.verticalSpace),
                  child: Text(
                    category.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 24,
                        ),

                        const Shadow(
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
        },
      ),
    );
  }
}
