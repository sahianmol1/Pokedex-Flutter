import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png';
  String name = 'pikachu';

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
                        transitionsBuilder: (_,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.easeInExpo);
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        }),
                  );
                },
                name: name,
                imageUrl: imageUrl,
                index: index.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
