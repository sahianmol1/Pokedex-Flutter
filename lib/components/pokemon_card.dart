import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/screens/pokemon_details.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    Key? key,
    required this.name,
    required this.index,
  }) : super(key: key);

  final String name;
  final int index;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  String imageUrl = '';

  void getPokemonImage(int index) {
    // List<String> split = url.split('/');
    // split.removeAt(split.length - 1);
    // String index = split.last;

    setState(() {
      imageUrl =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$index.png';
    });

    getPokemonCardColor();
  }

  Color? pokemonCardColor;

  void getPokemonCardColor() async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      Image.network(imageUrl).image,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      pokemonCardColor = paletteGenerator.dominantColor?.color;
    });
  }

  @override
  void initState() {
    getPokemonImage(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 800),
              reverseTransitionDuration: const Duration(milliseconds: 800),
              pageBuilder: (_, __, ___) => PokemonDetailsScreen(
                    imageUrl: imageUrl,
                    name: widget.name,
                    index: widget.index,
                    dominantColor: pokemonCardColor ?? const Color(0xFF424242),
                  ),
              transitionsBuilder: (_, Animation<double> animation,
                  Animation<double> secondaryAnimation, Widget child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.easeInExpo);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
        );
      },
      child: Hero(
        tag: 'pokemon_container${widget.index}',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: pokemonCardColor ?? const Color(0xFF424242),
          ),
          child: GridTile(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image(
                  alignment: Alignment.topCenter,
                  image: NetworkImage(imageUrl),
                  height: 135.0,
                  width: 135.0,
                ),
              ),
            ),
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
