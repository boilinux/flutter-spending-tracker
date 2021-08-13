import 'package:flutter/material.dart';

class TitleDisplay extends StatelessWidget {
  const TitleDisplay({required this.title}) : assert(title != null);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      // margin: EdgeInsets.symmetric(
      //   vertical: 10,
      //   horizontal: 15,
      // ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
