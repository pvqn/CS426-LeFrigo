import 'package:flutter/material.dart';
import 'directions_item_list.dart';

class DirectionsTab extends StatefulWidget {
  const DirectionsTab({super.key});

  @override
  _DirectionsState createState() => _DirectionsState();
}

class _DirectionsState extends State<DirectionsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Column(children: [
      DirectionListView(),
    ]));
  }
}
