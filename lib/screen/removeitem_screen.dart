import 'package:flutter/material.dart';

class RemoveItemScreen extends StatefulWidget {
  static const routeName = '/removeItemScreen';

  @override
  State<StatefulWidget> createState() {
    return _RemoveItemState();
  }
}

class _RemoveItemState extends State<RemoveItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove item'),
      ),
    );
  }
}
