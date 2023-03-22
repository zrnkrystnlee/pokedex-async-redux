import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_asyn_redux/api/model/abilities.dart';
import 'package:pokedex_asyn_redux/api/model/moves.dart';
import 'package:pokedex_asyn_redux/api/model/stats.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    @JsonKey(name: 'abilities') required List<Abilities> abilities,
    @JsonKey(name: 'moves') required List<Moves> moves,
    @JsonKey(name: 'stats') required List<Stats> stats,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
