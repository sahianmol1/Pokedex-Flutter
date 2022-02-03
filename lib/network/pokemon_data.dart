import 'package:pokedex/network/NetworkHelper.dart';

class PokemonData {
  Future<dynamic> getPokemonList() async {
    String url = '${baseURL}pokemon/?offset=0&limit=100';
    NetworkHelper helper = NetworkHelper(url: url);
    var pokemonList = await helper.getDataFromNetwork();
    return pokemonList;
  }

  Future<dynamic> getPokemonDetails(String id) async {
    String url = '${baseURL}pokemon/$id';
    NetworkHelper helper = NetworkHelper(url: url);
    var pokemonDetails = await helper.getDataFromNetwork();
    return pokemonDetails;
  }

  void getPokemonImage(String pokemonIndex) {}
}

const String baseURL = 'https://pokeapi.co/api/v2/';
