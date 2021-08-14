import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NoResult extends StatelessWidget {
  // final cons;
  // NoResult(this.cons);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (e, cons) {
      return Column(
        children: <Widget>[
          Text(
            'No Transactions added yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: cons.maxHeight * 0.6,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    });
  }
}
