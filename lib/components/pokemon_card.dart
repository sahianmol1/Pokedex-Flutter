import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard(
      {required this.onCardClick,
      required this.imageUrl,
      required this.name,
      required this.index});
  final VoidCallback onCardClick;
  final String imageUrl;
  final String name;
  String index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClick,
      child: Hero(
        tag: 'pokemon_container$index',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: kColorElectric,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Image(
                image: NetworkImage(imageUrl),
                height: 120.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Material(
                color: Colors.transparent,
                child: Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
