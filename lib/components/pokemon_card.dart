import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_details.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard(
      {required this.imageUrl, required this.name, required this.index});

  final String imageUrl;
  final String name;
  String index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          // MaterialPageRoute(
          //   builder: (context) => PokemonDetailsScreen(
          //     imageUrl: imageUrl,
          //     name: name,
          //     index: index.toString(),
          //   ),
          // ),
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 800),
              reverseTransitionDuration: Duration(milliseconds: 800),
              pageBuilder: (_, __, ___) => PokemonDetailsScreen(
                    imageUrl: imageUrl,
                    name: name,
                    index: index.toString(),
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
            color: kColorElectric,
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
    );
  }
}
//
//
// Column(
// children: [
// const SizedBox(
// height: 10.0,
// ),
// Image(
// image: NetworkImage(imageUrl),
// height: 120.0,
// ),
// const SizedBox(
// height: 8.0,
// ),
// Material(
// color: Colors.transparent,
// child: Text(
// name,
// style: const TextStyle(
// color: Colors.white,
// fontSize: 20.0,
// fontWeight: FontWeight.bold),
// ),
// ),
// ],
// ),
