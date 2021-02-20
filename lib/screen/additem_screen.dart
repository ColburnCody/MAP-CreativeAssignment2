import 'package:CreativeAssignment2/model/listitem.dart';
import 'package:CreativeAssignment2/screen/start_screen.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  static const routeName = '/addItemScreen';
  @override
  State<StatefulWidget> createState() {
    return _AddItemState();
  }
}

class _AddItemState extends State<AddItemScreen> {
  _Controller con;
  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add item'),
      ),
      body: TextField(
        autofocus: true,
        onSubmitted: (val) {
          con.addItem(val);
          Navigator.pop(context);
        },
      ),
    );
  }
}

class _Controller {
  _AddItemState state;
  _Controller(this.state);

  void addItem(String item) {
    var task;
    if (item.length > 0) {
      task = ListItem(item: item);
      todoList.add(task);
    }
  }
}
