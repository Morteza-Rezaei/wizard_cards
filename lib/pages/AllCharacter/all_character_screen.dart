import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_cards/bloc/character_bloc/character_bloc.dart';
import 'package:wizard_cards/bloc/character_bloc/character_state.dart';
import 'package:wizard_cards/constants/app_decoration.dart';
import 'package:wizard_cards/constants/app_path.dart';
import 'package:wizard_cards/models/character_model.dart';
import 'package:wizard_cards/pages/CharacterDetail/character_detail.dart';
import 'package:wizard_cards/widgets.dart/app_widget.dart';

class AllCharacter extends StatefulWidget {
  final String title;
  final bool showOnlyStudents;
  final bool showOnlyStaff;
  const AllCharacter({
    super.key,
    required this.title,
    this.showOnlyStudents = false,
    this.showOnlyStaff = false,
  });

  @override
  State<AllCharacter> createState() => _AllCharacterState();
}

class _AllCharacterState extends State<AllCharacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            List<CharacterModel> filtered = state.characters;

            if (widget.showOnlyStudents) {
              filtered = filtered.where((c) => c.hogwartsStudent).toList();
            } else if (widget.showOnlyStaff) {
              filtered = filtered.where((c) => c.hogwartsStaff).toList();
            }
            return GridView.builder(
              padding: AppDecorations.appMargin,
              itemCount: state.characters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: AppDecorations.verticalSpace,
                crossAxisSpacing: AppDecorations.verticalSpace,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final character = filtered[index];

                return listCard(
                  theme: Theme.of(context),
                  imageUrl:
                      character.image.isNotEmpty
                          ? character.image
                          : AppPath.wizardPlaceholder,
                  title: character.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => CharacterDetailScreen(character: character),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is CharacterError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
