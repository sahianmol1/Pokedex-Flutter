import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/screens/pokemon_details.dart';

class PokemonCard extends StatefulWidget {
  PokemonCard(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.index})
      : super(key: key);

  final String imageUrl;
  final String name;
  int index;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late PaletteGenerator paletteGenerator;

  late Future<PaletteGenerator> paletteFuture;

  Future<PaletteGenerator> updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(widget.imageUrl).image,
    );
    return paletteGenerator;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paletteFuture = updatePaletteGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaletteGenerator>(
      future: paletteFuture,
      builder: (context, snapshot) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 800),
                reverseTransitionDuration: const Duration(milliseconds: 800),
                pageBuilder: (_, __, ___) => PokemonDetailsScreen(
                      imageUrl: widget.imageUrl,
                      name: widget.name,
                      index: widget.index,
                      dominantColor: snapshot.data?.dominantColor?.color ??
                          const Color(0xFF424242),
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
              color: snapshot.data?.dominantColor?.color ??
                  const Color(0xFF424242),
            ),
            child: GridTile(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image(
                    alignment: Alignment.topCenter,
                    image: NetworkImage(widget.imageUrl),
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
      ),
    );
  }
}
