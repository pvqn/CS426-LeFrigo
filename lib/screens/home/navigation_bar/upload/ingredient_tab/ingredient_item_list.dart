import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ingredient_item.dart';
import 'model.dart';

class IngredientListView extends StatefulWidget {
  @override
  _IngredientListViewState createState() => _IngredientListViewState();
}

class _IngredientListViewState extends State<IngredientListView> {
  TextEditingController _ingredientController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  String _selectedUnit = 'ounce';
  final List<String> unitList = ['ounce', 'gram', 'cup', 'tablespoon'];
  List<ingredient> itemList = [
    ingredient(name: 'yogurt', note: '', quantity: '3', unit: 'ounce'),
    ingredient(name: 'yogurt', note: '', quantity: '3', unit: 'ounce'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InputField(
              controller: _ingredientController,
              hintText: 'Name',
              labelText: 'New ingredient',
            ),
            SizedBox(height: 15),
            InputField(
              controller: _noteController,
              hintText: 'Note',
              labelText: 'Note',
            ),
            SizedBox(height: 35),
            QuantityAndUnitInput(
              quantityController: _quantityController,
              selectedUnit: _selectedUnit,
              unitList: unitList,
              onUnitChanged: (String newValue) {
                setState(() {
                  _selectedUnit = newValue;
                });
              },
              onAddButtonPressed: () {
                final newItem = ingredient(
                  name: _ingredientController.text,
                  note: _noteController.text,
                  quantity: _quantityController.text,
                  unit: _selectedUnit,
                );
                setState(() {
                  itemList.add(newItem);
                  _ingredientController.clear();
                  _quantityController.clear();
                  _noteController.clear();
                  _selectedUnit = 'ounce';
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            IngredientsList(itemList: itemList),
          ],
        ),
      ),
    );
  }
}

class QuantityAndUnitInput extends StatelessWidget {
  final TextEditingController quantityController;
  final String selectedUnit;
  final List<String> unitList;
  final Function(String) onUnitChanged;
  final VoidCallback onAddButtonPressed;

  const QuantityAndUnitInput({
    required this.quantityController,
    required this.selectedUnit,
    required this.unitList,
    required this.onUnitChanged,
    required this.onAddButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 100,
              child: InputField(
                controller: quantityController,
                hintText: '',
                labelText: 'Quantity',
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                child: DropdownButtonFormField<String>(
                  value: selectedUnit,
                  onChanged: (String? newValue) {
                    onUnitChanged(newValue!);
                  },
                  items: unitList.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(' ' + unit,
                          style: GoogleFonts.poppins(
                              fontSize: 16)), // Customize text style
                    );
                  }).toList(),
                  style: TextStyle(
                    color: Colors
                        .black, // Customize the text color of the selected item
                    fontSize:
                        16.0, // Customize the text size of the selected item
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Customize border radius
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0), // Customize border color and width
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 16.0), // Customize content padding
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [AddButton(onPressed: onAddButtonPressed)],
        )
      ],
    );
  }
}

class IngredientsList extends StatelessWidget {
  final List<ingredient> itemList;

  IngredientsList({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return IngredientItem(
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

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  InputField(
      {required this.controller,
      required this.hintText,
      required this.labelText});

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
