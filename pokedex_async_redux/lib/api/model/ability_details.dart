import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability_details.freezed.dart';

part 'ability_details.g.dart';

@freezed
//all pokemons have 1 ability
class AbilityDetails with _$AbilityDetails {
  factory AbilityDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _AbilityDetails;

  factory AbilityDetails.fromJson(Map<String, dynamic> json) => _$AbilityDetailsFromJson(json);
}
