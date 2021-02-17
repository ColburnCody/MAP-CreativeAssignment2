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
          con.selected != null
              ? [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: con.delete,
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: con.cancel,
                  ),
                ]
              : IconButton(
                  icon: Icon(Icons.add),
                  onPressed: con.add,
                ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: con.getTile,
      ),
    );
  }
}

class _Controller {
  _StartState state;
  _Controller(this.state);

  List<int> selected;
  final Color selectedColor = Colors.green[500];
  final Color unselectedColor = Colors.green[200];

  Widget getTile(BuildContext context, int index) {
    return Container(
      color: (selected != null && selected.indexOf(index) >= 0)
          ? selectedColor
          : unselectedColor,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(todoList[index].item),
        subtitle: Text(
          todoList[index].time,
        ),
        onTap: () {
          _onTap(context, index);
        },
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    if (selected == null) {
      selected.add(index);
    }
    state.render(() {
      if (selected.indexOf(index) < 0) {
        selected.add(index);
      } else {
        selected.removeWhere((value) => value == index);
        if (selected.length == 0) selected = null;
      }
    });
  }

  void add() {
    Navigator.pushNamed(state.context, AddItemScreen.routeName);
  }

  void delete() {}

  void cancel() {
    state.render(() => selected = null);
  }
}
