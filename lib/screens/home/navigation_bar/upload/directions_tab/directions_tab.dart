import 'package:flutter/material.dart';
import 'directions_item_list.dart';
import 'model.dart';

class DirectionsTab extends StatefulWidget {
  DirectionsTab({required this.itemList});
  List<Direction> itemList;

  @override
  DirectionsState createState() => DirectionsState();
}

class DirectionsState extends State<DirectionsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DirectionListView(
        itemList: widget.itemList,
      ),
    ]);
  }
}
