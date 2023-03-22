import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability.freezed.dart';

part 'ability.g.dart';

@freezed
//all pokemons have 1 ability
class Ability with _$Ability {
  factory Ability({
    @JsonKey(name: 'name') required String name,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
