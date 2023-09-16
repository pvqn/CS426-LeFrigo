import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'directions_item.dart';
import 'model.dart';

class DirectionListView extends StatefulWidget {
  @override
  _DirectionListViewState createState() => _DirectionListViewState();
}

class _DirectionListViewState extends State<DirectionListView> {
  TextEditingController _descriptionController = TextEditingController();
  int order = 1;
  List<Direction> itemList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InputField(
              controller: _descriptionController,
              hintText: 'Enter description',
              labelText: 'Step ' + order.toString(),
              maxLines: 5,
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddButton(onPressed: () {
                  final newItem = Direction(
                      order: order++, description: _descriptionController.text);
                  setState(() {
                    itemList.add(newItem);
                    _descriptionController.clear();
                  });
                }),
              ],
            ),
            DirectionsList(itemList: itemList),
            SizedBox(height: 5),
            FinishButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class DirectionsList extends StatelessWidget {
  final List<Direction> itemList;

  DirectionsList({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Directions',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return DirectionItem(
              item: itemList[index],
            );
          },
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  static final Color customColor = Color(0xFFE25E3E);

  AddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Add',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class FinishButton extends StatelessWidget {
  final VoidCallback onPressed;
  static final Color customColor = Color(0xFFE25E3E);

  FinishButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Finish',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  int maxLines;

  InputField(
      {required this.controller,
      required this.hintText,
      required this.labelText,
      required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              )),
        )
      ],
    );
  }
}
