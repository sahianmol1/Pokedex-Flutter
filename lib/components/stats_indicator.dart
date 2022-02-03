import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatsIndicators extends StatefulWidget {
  final String statText;
  final Color sliderColor;
  late double sliderValue;
  final int statValue;

  StatsIndicators({
    Key? key,
    required this.sliderColor,
    required this.sliderValue,
    required this.statText,
    required this.statValue,
  }) : super(key: key);

  @override
  State<StatsIndicators> createState() => _StatsIndicatorsState();
}

class _StatsIndicatorsState extends State<StatsIndicators> {
  double statValueLeftPadding() {
    double padding = widget.statValue - 55.0;
    if (padding < 0) {
      padding = 0.0;
    }
    return padding;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24.0,
          ),
          Text(
            widget.statText,
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
              child: Stack(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: widget.sliderColor,
                      trackHeight: 14.0,
                      thumbShape: SliderComponentShape.noThumb,
                      inactiveTrackColor: Colors.white,
                      overlayShape: SliderComponentShape.noOverlay,
                      rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
                    ),
                    child: Slider(
                      onChanged: (newValue) {
                        widget.sliderValue = newValue;
                        if (kDebugMode) {
                          print(newValue);
                        }
                      },
                      value: widget.sliderValue,
                      min: 0,
                      max: 300,
                      label: '167',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: statValueLeftPadding()),
                    child: Text(
                      '${widget.statValue.toStringAsFixed(0)}/300',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
