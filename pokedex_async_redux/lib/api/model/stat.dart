import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat.freezed.dart';

part 'stat.g.dart';

@freezed
class Stat with _$Stat {
  factory Stat({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
