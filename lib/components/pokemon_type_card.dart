import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 32.0),
          child: Text(
            'water',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
