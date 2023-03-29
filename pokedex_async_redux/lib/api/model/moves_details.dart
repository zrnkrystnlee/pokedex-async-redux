import 'package:freezed_annotation/freezed_annotation.dart';

part 'moves_details.freezed.dart';

part 'moves_details.g.dart';

@freezed
class MovesDetails with _$MovesDetails {
  factory MovesDetails({
    @JsonKey(name: 'name') required String name, //name of the move
    @JsonKey(name: 'url') required String url, //info of the move
  }) = _MovesDetails;

  factory MovesDetails.fromJson(Map<String, dynamic> json) => _$MovesDetailsFromJson(json);
}
