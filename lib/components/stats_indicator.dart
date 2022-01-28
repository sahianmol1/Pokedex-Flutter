import 'package:flutter/material.dart';

class StatsIndicators extends StatelessWidget {
  final String statText;
  final Color sliderColor;
  final double sliderValue;

  StatsIndicators(
      {required this.sliderColor,
      required this.sliderValue,
      required this.statText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24.0,
          ),
          Text(
            statText,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 24.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: sliderColor,
                  trackHeight: 14.0,
                  thumbShape: SliderComponentShape.noThumb,
                  inactiveTrackColor: Colors.white,
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: Slider(
                  onChanged: (newValue) {},
                  value: sliderValue,
                  min: 0,
                  max: 300,
                  label: '167',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
