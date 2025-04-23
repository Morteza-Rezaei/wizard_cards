import 'package:flutter/material.dart';
import 'package:wizard_cards/constants/app_decoration.dart';
import 'package:wizard_cards/constants/app_path.dart';
import 'package:wizard_cards/models/character_model.dart';
import 'package:wizard_cards/widgets.dart/app_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        padding: AppDecorations.appMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Resmi
            circleAvatar(
              imageUrl:
                  character.image.isNotEmpty
                      ? character.image
                      : AppPath.wizardPlaceholder,
              radius: AppDecorations.verticalSpace * 6,
            ),
            const SizedBox(height: AppDecorations.verticalSpace),

            buildSectionTitle(title: "Basic Info :", theme: theme),
            infoCard(
              theme: theme,
              children: [
                buildKeyValue(
                  key: "Full Name",
                  value: character.name,
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Alternate Names",
                  value:
                      character.alternateNames.isNotEmpty
                          ? character.alternateNames.join(", ")
                          : "-",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "House",
                  value: character.house,
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Species",
                  value: character.species,
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Gender",
                  value: character.gender,
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Date of Birth",
                  value: character.dateOfBirth ?? "-",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Year of Birth",
                  value: character.yearOfBirth?.toString() ?? "-",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Alive",
                  value: character.alive ? "Yes" : "No",
                  theme: theme,
                ),
              ],
            ),

            const SizedBox(height: 16),

            buildSectionTitle(title: "Attributes", theme: theme),
            infoCard(
              theme: theme,
              children: [
                buildKeyValue(
                  key: "Wizard",
                  value: character.wizard ? "Yes" : "No",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Ancestry",
                  value:
                      character.ancestry.isNotEmpty ? character.ancestry : "-",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Eye Colour",
                  value:
                      character.eyeColour.isNotEmpty
                          ? character.eyeColour
                          : "-",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Hair Colour",
                  value:
                      character.hairColour.isNotEmpty
                          ? character.hairColour
                          : "-",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Patronus",
                  value:
                      character.patronus.isNotEmpty ? character.patronus : "-",
                  theme: theme,
                ),
              ],
            ),

            const SizedBox(height: 16),

            buildSectionTitle(title: "Hogwarts", theme: theme),
            infoCard(
              theme: theme,
              children: [
                buildKeyValue(
                  key: "Student",
                  value: character.hogwartsStudent ? "Yes" : "No",
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Staff",
                  value: character.hogwartsStaff ? "Yes" : "No",
                  theme: theme,
                ),
              ],
            ),

            const SizedBox(height: 16),

            buildSectionTitle(title: "Portrayal", theme: theme),
            infoCard(
              theme: theme,
              children: [
                buildKeyValue(
                  key: "Actor",
                  value: character.actor,
                  theme: theme,
                ),
                buildKeyValue(
                  key: "Alternate Actors",
                  value:
                      character.alternateActors.isNotEmpty
                          ? character.alternateActors.join(", ")
                          : "-",
                  theme: theme,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Wand Info
            if (character.wand != null) ...[
              buildSectionTitle(title: "Wand", theme: theme),
              infoCard(
                theme: theme,
                children: [
                  buildKeyValue(
                    key: "Wood",
                    value:
                        character.wand!.wood.isNotEmpty
                            ? character.wand!.wood
                            : "-",
                    theme: theme,
                  ),
                  buildKeyValue(
                    key: "Core",
                    value:
                        character.wand!.core.isNotEmpty
                            ? character.wand!.core
                            : "-",
                    theme: theme,
                  ),
                  buildKeyValue(
                    key: "Length",
                    value: character.wand!.length?.toString() ?? "-",
                    theme: theme,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
