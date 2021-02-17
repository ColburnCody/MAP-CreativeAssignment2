import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  static const routeName = '/addItemScreen';
  @override
  State<StatefulWidget> createState() {
    return _AddItemState();
  }
}

class _AddItemState extends State<AddItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add item'),
      ),
    );
  }
}
