import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'directions_item_list.dart';

class DirectionsTab extends StatefulWidget {
  @override
  _DirectionsState createState() => _DirectionsState();
}

class _DirectionsState extends State<DirectionsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      DirectionListView(),
    ]));
  }
}
