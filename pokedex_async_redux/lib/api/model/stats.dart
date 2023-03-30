import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_asyn_redux/api/model/stats_details.dart';

part 'stats.freezed.dart';

part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  factory Stats({
    @JsonKey(name: 'base_stat') required int baseStat,
    @JsonKey(name: 'stat') required StatsDetails stat,
  }) = _PokemonStats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
