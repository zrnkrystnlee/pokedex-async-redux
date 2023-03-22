import 'package:freezed_annotation/freezed_annotation.dart';

part 'move.freezed.dart';

part 'move.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    @JsonKey(name: 'name') required String name, //name of the move
    @JsonKey(name: 'url') required String url, //info of the move
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
