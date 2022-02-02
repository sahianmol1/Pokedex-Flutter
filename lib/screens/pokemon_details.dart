import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/components/height_weight_card.dart';
import 'package:pokedex/components/pokemon_type_card.dart';
import 'package:pokedex/components/stats_indicator.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonDetailsScreen extends StatefulWidget {
  PokemonDetailsScreen({
    required this.imageUrl,
    required this.name,
    required this.index,
    required this.dominantColor,
  });

  String imageUrl;
  String name;
  String index;
  Color dominantColor;

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation<Color?> tweenAnimation;
  late int hpRandom;
  late int atkRandom;
  late int defRandom;
  late int spdRandom;
  late int expRandom;
  late Color? statusBarColor;

  late String imageUrl;
  late String name;
  late String index;
  bool backPressed = false;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
    name = widget.name;
    index = widget.index;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    tweenAnimation =
        ColorTween(begin: Color(0xFFD53A47), end: widget.dominantColor)
            .animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('completed');
      }
    });

    controller.addListener(() {
      setState(() {
        print(controller.value);
      });
    });

    animation.addListener(() {
      setState(() {
        statusBarColor = tweenAnimation.value;
      });
    });

    int min = 50;
    int max = 300;
    var random = Random();
    hpRandom = min + random.nextInt(max - min);
    atkRandom = min + random.nextInt(max - min);
    spdRandom = min + random.nextInt(max - min);
    defRandom = min + random.nextInt(max - min);
    expRandom = min + random.nextInt(max - min);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<bool> onBackPressed() {
    setState(() {
      backPressed = true;
    });
    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:
                      backPressed ? Color(0xFFD53A47) : tweenAnimation.value,
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
                  background: Hero(
                    tag: 'pokemon_container$index',
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.dominantColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                      ),
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
                Center(
                  child: Text(
                    name,
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
                  sliderValue: animation.value * hpRandom,
                  statValue: hpRandom,
                  statText: 'HP1',
                ),
                StatsIndicators(
                  sliderColor: Colors.orange.shade400,
                  sliderValue: animation.value * atkRandom,
                  statValue: atkRandom,
                  statText: 'ATK',
                ),
                StatsIndicators(
                  sliderColor: Colors.blueAccent,
                  sliderValue: animation.value * defRandom,
                  statValue: defRandom,
                  statText: 'DEF',
                ),
                StatsIndicators(
                  sliderColor: Colors.blueGrey,
                  sliderValue: animation.value * spdRandom,
                  statValue: spdRandom,
                  statText: 'SPD',
                ),
                StatsIndicators(
                  sliderColor: Colors.green.shade600,
                  sliderValue: animation.value * expRandom,
                  statValue: expRandom,
                  statText: 'EXP',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
