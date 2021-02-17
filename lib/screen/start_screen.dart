import 'package:CreativeAssignment2/model/listitem.dart';
import 'package:CreativeAssignment2/screen/additem_screen.dart';
import 'package:CreativeAssignment2/screen/removeitem_screen.dart';
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
      appBar: AppBar(title: Text('Get it together, man'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: con.add,
        ),
        IconButton(icon: Icon(Icons.delete), onPressed: con.delete),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: con.getSchedule(),
        ),
      ),
    );
  }
}

class _Controller {
  _StartState state;
  _Controller(this.state);

  List<Widget> getSchedule() {
    return todoList.map((listitem) {
      return Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        color: Colors.green[300],
        elevation: 15.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    listitem.time,
                    style: Theme.of(state.context).textTheme.headline5,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    listitem.item,
                    style: Theme.of(state.context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }

  void add() {
    Navigator.pushNamed(state.context, AddItemScreen.routeName);
  }

  void delete() {
    Navigator.pushNamed(state.context, RemoveItemScreen.routeName);
  }
}
