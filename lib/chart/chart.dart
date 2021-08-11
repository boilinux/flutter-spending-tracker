import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Text('Chart'),
        color: Colors.blue,
        elevation: 5,
      ),
    );
  }
}
