import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonType extends StatelessWidget {
  var type;
  PokemonType({required this.type});

  Color getRibbonColor() {
    switch (type.toString()) {
      case "fighting":
        {
          return kColorFighting;
        }
      case "flying":
        {
          return kColorFlying;
        }
      case "poison":
        {
          return kColorFighting;
        }
      case "ground":
        {
          return kColorGround;
        }
      case "rock":
        {
          return kColorRock;
        }
      case "bug":
        {
          return kColorBug;
        }
      case "ghost":
        {
          return kColorGhost;
        }
      case "steel":
        {
          return kColorSteel;
        }
      case "fire":
        {
          return kColorFire;
        }
      case "water":
        {
          return kColorWater;
        }
      case "grass":
        {
          return kColorGrass;
        }
      case "electric":
        {
          return kColorElectric;
        }
      case "psychic":
        {
          return kColorPsychic;
        }
      case "ice":
        {
          return kColorIce;
        }
      case "dragon":
        {
          return kColorDragon;
        }
      case "fairy":
        {
          return kColorFairy;
        }
      case "dark":
        {
          return kColorDark;
        }
      default:
        {
          return kColorDefault;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: getRibbonColor(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 32.0),
          child: Text(
            type,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
