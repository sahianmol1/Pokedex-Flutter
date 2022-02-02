import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/screens/pokemon_details.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard(
      {required this.imageUrl, required this.name, required this.index});

  final String imageUrl;
  final String name;
  String index;

  late PaletteGenerator paletteGenerator;

  Future<PaletteGenerator> updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(imageUrl).image,
    );
    return paletteGenerator;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaletteGenerator>(
      future: updatePaletteGenerator(),
      builder: (context, snapshot) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 800),
                reverseTransitionDuration: Duration(milliseconds: 800),
                pageBuilder: (_, __, ___) => PokemonDetailsScreen(
                      imageUrl: imageUrl,
                      name: name,
                      index: index.toString(),
                      dominantColor: snapshot.data?.dominantColor?.color ??
                          Color(0xFF424242),
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
          tag: 'pokemon_container$index',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: snapshot.data?.dominantColor?.color ?? Color(0xFF424242),
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
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
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
