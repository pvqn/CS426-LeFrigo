import 'package:flutter/material.dart';
import 'directions_item_list.dart';

class DirectionsTab extends StatefulWidget {
  const DirectionsTab({super.key});

  @override
  DirectionsState createState() => DirectionsState();
}

class DirectionsState extends State<DirectionsTab> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      DirectionListView(),
    ]);
  }
}
