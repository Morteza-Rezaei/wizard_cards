import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_cards/bloc/spell_bloc/spell_bloc.dart';
import 'package:wizard_cards/bloc/spell_bloc/spell_state.dart';
import 'package:wizard_cards/constants/app_decoration.dart';
import 'package:wizard_cards/widgets.dart/app_widget.dart';

class AllSpellScreen extends StatefulWidget {
  const AllSpellScreen({super.key});

  @override
  State<AllSpellScreen> createState() => _AllSpellScreenState();
}

class _AllSpellScreenState extends State<AllSpellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spells"), centerTitle: true),
      body: BlocBuilder<SpellBloc, SpellState>(
        builder: (context, state) {
          if (state is SpellLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SpellLoaded) {
            return ListView.builder(
              padding: AppDecorations.appMargin,
              itemCount: state.spells.length,
              itemBuilder: (context, index) {
                final spell = state.spells[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: AppDecorations.verticalSpace / 2,
                  ),
                  child: infoCard(
                    theme: Theme.of(context),
                    children: [
                      buildKeyValue(
                        key: "Name",
                        value: spell.name,
                        theme: Theme.of(context),
                      ),
                      buildKeyValue(
                        key: "Description",
                        value: spell.description,
                        theme: Theme.of(context),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is SpellError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
