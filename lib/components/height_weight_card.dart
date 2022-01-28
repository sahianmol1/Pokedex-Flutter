import 'package:flutter/material.dart';

class HeightAndWeightCard extends StatelessWidget {
  final String weightOrHeightValue;
  final String subtitleText;

  HeightAndWeightCard(
      {required this.subtitleText, required this.weightOrHeightValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weightOrHeightValue,
          style: const TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          subtitleText,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
