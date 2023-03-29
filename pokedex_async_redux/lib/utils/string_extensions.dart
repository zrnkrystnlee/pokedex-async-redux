import 'package:pokedex_asyn_redux/utils/string_constants.dart';

extension StringExtension on String {
  String get pokemonId => split('/')[6];

  String get toCustomUrl => imageUrl.replaceFirst(indexKey, pokemonId);
}
