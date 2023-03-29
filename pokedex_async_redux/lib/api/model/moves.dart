import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_asyn_redux/api/model/moves_details.dart';

part 'moves.freezed.dart';

part 'moves.g.dart';

@freezed
class Moves with _$Moves {
  factory Moves({
    @JsonKey(name: 'move') required MovesDetails moves,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
