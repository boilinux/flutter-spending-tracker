import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  final bool isChart;
  final Function showChart;

  ToggleSwitch({
    required this.isChart,
    required this.showChart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Show Chart'),
        Switch.adaptive(value: isChart, onChanged: (val) => showChart(val)),
      ],
    );
  }
}
