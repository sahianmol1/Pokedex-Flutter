import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/screens/pokemon_details.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String imageUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png';
  String name = 'pikachu';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kColorBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.05 / 1,
          children: List.generate(
            10,
            (index) => PokemonCard(
              onCardClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokemonDetailsScreen(
                      imageUrl: imageUrl,
                      name: name,
                      index: index.toString(),
                    ),
                  ),
                );
              },
              name: name,
              imageUrl: imageUrl,
              index: index.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
