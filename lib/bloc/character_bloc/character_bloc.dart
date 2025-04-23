import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizard_cards/models/character_model.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<FetchCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final response = await Dio().get(
          'https://hp-api.onrender.com/api/characters',
        );
        final List data = response.data;
        final characters = data.map((e) => CharacterModel.fromJson(e)).toList();
        emit(CharacterLoaded(characters));
      } catch (e) {
        emit(CharacterError("Failed to load characters: $e"));
      }
    });
  }
}
