import 'package:flutter/material.dart';
import 'directions_item_list.dart';
import 'model.dart';

class DirectionsTab extends StatefulWidget {
  DirectionsTab({required this.itemList, required this.onPressedButton});
  List<Direction> itemList;
  final Function onPressedButton;

  @override
  DirectionsState createState() => DirectionsState();
}

class DirectionsState extends State<DirectionsTab> {
  @override
  Widget build(BuildContext context) {
    print('ok');
    return Column(children: [
      DirectionListView(
        itemList: widget.itemList,
        onPressedButton: widget.onPressedButton,
      ),
    ]);
  }
}
