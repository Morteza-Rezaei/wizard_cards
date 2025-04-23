import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_cards/models/spells_model.dart';
import 'spell_event.dart';
import 'spell_state.dart';

class SpellBloc extends Bloc<SpellEvent, SpellState> {
  SpellBloc() : super(SpellInitial()) {
    on<FetchSpells>((event, emit) async {
      emit(SpellLoading());
      try {
        final response = await Dio().get(
          'https://hp-api.onrender.com/api/spells',
        );
        final List data = response.data;
        final spells = data.map((e) => Spell.fromJson(e)).toList();
        emit(SpellLoaded(spells));
      } catch (e) {
        emit(SpellError("Failed to load spells: $e"));
      }
    });
  }
}
