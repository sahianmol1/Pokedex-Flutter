import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/screens/pokemon_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('PokeDex'),
          backgroundColor: Color(0xFFD53A47),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFD53A47),
          ),
        ),
        body: PokemonList(),
      ),
    );
  }
}
