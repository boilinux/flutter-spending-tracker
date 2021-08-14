import 'package:flutter/material.dart';

class ActionList extends StatelessWidget {
  final String id;
  final Function deleteTransactionHandler;
  ActionList({required this.id, required this.deleteTransactionHandler});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () => deleteTransactionHandler(id),
      color: Theme.of(context).errorColor,
    );
  }
}
