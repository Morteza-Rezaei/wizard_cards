import 'package:wizard_cards/models/spells_model.dart';

abstract class SpellState {}

class SpellInitial extends SpellState {}

class SpellLoading extends SpellState {}

class SpellLoaded extends SpellState {
  final List<Spell> spells;
  SpellLoaded(this.spells);
}

class SpellError extends SpellState {
  final String message;
  SpellError(this.message);
}
