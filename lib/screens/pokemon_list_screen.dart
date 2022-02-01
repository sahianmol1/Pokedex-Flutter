import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/network/pokemon_data.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  var pokemonListData;
  List<dynamic> pokemonList = [];

  void getPokemonList() async {
    PokemonData list = PokemonData();
    pokemonListData = await list.getPokemonList();

    setState(() {
      pokemonList = pokemonListData['results'];
    });
  }

  String getPokemonImage(String url) {
    var imageUrl;

    List<String> split = url.split('/');
    split.removeAt(split.length - 1);
    String index = split.last;

    setState(() {
      imageUrl =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$index.png';
    });

    return imageUrl;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDex'),
        backgroundColor: Color(0xFFD53A47),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFD53A47),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: kColorBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            childAspectRatio: 1 / 1,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(pokemonList.length, (index) {
              return PokemonCard(
                name: pokemonList[index]['name'],
                imageUrl: getPokemonImage(pokemonList[index]['url']),
                index: index.toString(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
