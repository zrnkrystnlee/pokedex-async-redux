import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    //TODO: This  will be removed
    @Default('') String sample,
    @Default(<Pokemon>[]) List<Pokemon> pokemons,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
