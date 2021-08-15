import 'package:flutter/material.dart';

class MainFloatingButton extends StatelessWidget {
  final ctx;
  final Function addNewTransaction;
  MainFloatingButton(this.ctx, this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add_circle_sharp,
        size: 50,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () => addNewTransaction(ctx),
    );
  }
}
