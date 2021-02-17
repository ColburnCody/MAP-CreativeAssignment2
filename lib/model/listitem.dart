class ListItem {
  String item;
  String time;

  ListItem({
    this.item,
    this.time,
  });
}

var todoList = [
  ListItem(
    item: 'Meeting',
    time: '9 am',
  ),
  ListItem(
    item: 'Lunch with sister',
    time: '12 pm',
  ),
];
