import 'package:pokedex_asyn_redux/utils/constants.dart';

extension StringExtension on String {
  String get pokemonId => split('/')[6];

  String get toCustomUrl => imageUrl.replaceFirst(indexKey, pokemonId);

  String capitalizeName() {
    return this.toUpperCase();
  }
}
