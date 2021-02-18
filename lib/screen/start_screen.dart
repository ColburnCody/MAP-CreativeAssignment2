import 'package:CreativeAssignment2/model/listitem.dart';
import 'package:CreativeAssignment2/screen/additem_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  static const routeName = '/startScreen';

  @override
  State<StatefulWidget> createState() {
    return _StartState();
  }
}

class _StartState extends State<StartScreen> {
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
        title: Text('Get it together, man'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: con.add,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: con.buildList,
      ),
    );
  }
}

class _Controller {
  _StartState state;
  _Controller(this.state);

  Widget buildList(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Colors.green,
      elevation: 15.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ListTile(
        title: Text(todoList[index].item),
        onTap: () => delete(index),
      ),
    );
  }

  void add() {
    Navigator.pushNamed(state.context, AddItemScreen.routeName);
  }

  void delete(int index) {
    showDialog(
      context: state.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mark ${todoList[index].item} as done?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(state.context).pop(),
            ),
            FlatButton(
                child: Text('Mark as done'),
                onPressed: () {
                  removeItem(index);
                  Navigator.of(state.context).pop();
                }),
          ],
        );
      },
    );
  }

  void removeItem(int index) {
    state.setState(() => todoList.removeAt(index));
  }
}
