import 'package:pokedex/network/NetworkHelper.dart';

class PokemonData {
  Future<dynamic> getPokemonList() async {
    String url = '${BASE_URL}pokemon/?offset=0&limit=100';
    NetworkHelper helper = NetworkHelper(url: url);
    var pokemonList = await helper.getDataFromNetwork();
    return pokemonList;
  }

  void getPokemonImage(String pokemonIndex) {}
}

const BASE_URL = 'https://pokeapi.co/api/v2/';
