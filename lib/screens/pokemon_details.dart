import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/components/height_weight_card.dart';
import 'package:pokedex/components/pokemon_type_card.dart';
import 'package:pokedex/components/stats_indicator.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonDetailsScreen extends StatefulWidget {
  PokemonDetailsScreen(
      {required this.imageUrl, required this.name, required this.index});

  String imageUrl;
  String name;
  String index;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  late String imageUrl;
  late String name;
  late String index;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
    name = widget.name;
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: kColorElectric,
              ),
              backgroundColor: kColorBackground,
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              collapsedHeight: 60.0,
              onStretchTrigger: () async {
                setState(() {});
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Pokedex',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '#025',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: const BoxDecoration(
                    color: kColorElectric,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Hero(
                    tag: 'pokemon_container$index',
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100.0,
                        ),
                        Expanded(
                          child: ClipRRect(
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: DecoratedBox(
          decoration: const BoxDecoration(
            color: kColorBackground,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              const Center(
                child: Text(
                  'pikachu',
                  style: TextStyle(fontSize: 38.0, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Center(
                child: SizedBox(
                  height: 45.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PokemonType();
                    },
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HeightAndWeightCard(
                    weightOrHeightValue: "90.5 KG",
                    subtitleText: 'weight',
                  ),
                  HeightAndWeightCard(
                    weightOrHeightValue: '1.7 M',
                    subtitleText: 'height',
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Center(
                child: Text(
                  'Base Stats',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              StatsIndicators(
                sliderColor: const Color(0xFFEB1555),
                sliderValue: 167,
                statText: 'HP1',
              ),
              StatsIndicators(
                sliderColor: Colors.orange.shade400,
                sliderValue: 190,
                statText: 'ATK',
              ),
              StatsIndicators(
                sliderColor: Colors.blueAccent,
                sliderValue: 250,
                statText: 'DEF',
              ),
              StatsIndicators(
                sliderColor: Colors.blueGrey,
                sliderValue: 102,
                statText: 'SPD',
              ),
              StatsIndicators(
                sliderColor: Colors.green.shade600,
                sliderValue: 137,
                statText: 'EXP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
