import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
  bool showSpinner = false;

  void getPokemonList() async {
    setState(() {
      showSpinner = true;
    });
    PokemonData list = PokemonData();
    pokemonListData = await list.getPokemonList();

    setState(() {
      pokemonList = pokemonListData['results'];
      showSpinner = false;
    });
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
        title: const Text('PokeDex'),
        backgroundColor: const Color(0xFFD53A47),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFD53A47),
        ),
      ),
      body: ModalProgressHUD(
        color: kColorBackground,
        progressIndicator: const CircularProgressIndicator(
          color: Color(0xFFD53A47),
        ),
        inAsyncCall: showSpinner,
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: kColorBackground,
          ),
          child: RawScrollbar(
            thumbColor: const Color(0xFFD53A47),
            isAlwaysShown: true,
            thickness: 4.0,
            interactive: true,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                addAutomaticKeepAlives: true,
                itemCount: pokemonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return PokemonCard(
                    key: UniqueKey(),
                    name: pokemonList[index]['name'],
                    index: index + 1,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
