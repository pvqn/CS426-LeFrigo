import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'directions_item.dart';
import 'model.dart';

class DirectionListView extends StatefulWidget {
  DirectionListView({required this.itemList, required this.onPressedButton});

  List<Direction> itemList;
  final Function onPressedButton;
  @override
  DirectionListViewState createState() => DirectionListViewState();
}

class DirectionListViewState extends State<DirectionListView> {
  final TextEditingController _descriptionController = TextEditingController();
  int order = 1;
  late List<Direction> _itemList;

  @override
  void initState() {
    super.initState();
    _itemList = widget.itemList;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InputField(
              controller: _descriptionController,
              hintText: 'Enter description',
              labelText: 'Step $order',
              maxLines: 5,
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddButton(onPressed: () {
                  final newItem = Direction(
                      order: order++, description: _descriptionController.text);
                  setState(() {
                    _itemList.add(newItem);
                    _descriptionController.clear();
                  });
                }),
              ],
            ),
            DirectionsList(itemList: _itemList),
            const SizedBox(height: 5),
            FinishButton(onPressed: () {
              widget.onPressedButton();
            })
          ],
        ),
      ),
    );
  }
}

class DirectionsList extends StatelessWidget {
  final List<Direction> itemList;

  const DirectionsList({super.key, required this.itemList});

  @override
  Widget build(BuildContext context) {
    print('ok');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Directions',
          style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 10),
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
  static const Color customColor = Color(0xFFE25E3E);

  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Text(
          'Add',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class FinishButton extends StatelessWidget {
  final VoidCallback onPressed;
  static const Color customColor = Color(0xFFE25E3E);

  const FinishButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Text(
          'Finish',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
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
  final int maxLines;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.maxLines,
  });

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
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              )),
        )
      ],
    );
  }
}
