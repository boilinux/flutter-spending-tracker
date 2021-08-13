import 'package:flutter/material.dart';

class TitleDisplay extends StatelessWidget {
  const TitleDisplay({required this.title}) : assert(title != null);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
