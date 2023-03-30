import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_asyn_redux/api/model/ability_details.dart';

part 'abilities.freezed.dart';

part 'abilities.g.dart';

@freezed
//for pokemons with 2 or more abilities; max is 3
class Abilities with _$Abilities {
  factory Abilities({
    @JsonKey(name: 'ability') required AbilityDetails abilities,
  }) = _Abilities;

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
}
