import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/providers/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'ingredient_item.dart';
import 'model.dart';

class IngredientListView extends StatefulWidget {
  List<ingredient> itemList;

  IngredientListView({required this.itemList});

  @override
  IngredientListViewState createState() => IngredientListViewState();
}

class IngredientListViewState extends State<IngredientListView> {
  late List<ingredient> itemList = widget.itemList;
  final TextEditingController _ingredientController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String _selectedUnit = 'ounce';
  String _selectedIng = 'Butter';
  final List<String> unitList = ['ounce', 'gram', 'cup', 'tablespoon'];

  // Create a list of ingredient names for autocomplete
  List<String> ingredientNames = [
    'Butter',
    'Flour',
    'Sugar',
    'Salt',
    // Add more ingredient names here
  ];

  @override
  void initState() {
    super.initState();

    print('ok');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Autocomplete text field for ingredient name
            Card(
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Add rounded corners
              ),
              child: FutureBuilder(
                  future: Provider.of<RecipeProvider>(context, listen: false)
                      .getListOfIngredients(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final ingredientList = snapshot.data as List<String>;
                      print(ingredientList);
                      return Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }
                          return ingredientList.where((String ingredient) {
                            return ingredient
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (String ingredient) {
                          setState(() {
                            _selectedIng = ingredient;
                          });
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController fieldTextEditingController,
                            FocusNode fieldFocusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                              controller: fieldTextEditingController,
                              focusNode: fieldFocusNode,
                              onSubmitted: (String value) {
                                onFieldSubmitted();
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingredient',
                                hintStyle: GoogleFonts.poppins(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD9D9D9), width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ));
                        },
                      );
                    } else {
                      return const Text('No data');
                    }
                  }),
            ),
            const SizedBox(height: 15),
            InputField(
              controller: _noteController,
              hintText: 'Note',
              labelText: 'Note',
            ),
            const SizedBox(height: 35),
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
                  name: _selectedIng,
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
            const SizedBox(
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
    super.key,
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
            SizedBox(
              width: 100,
              child: InputField(
                controller: quantityController,
                hintText: '',
                labelText: 'Quantity',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedUnit,
                onChanged: (String? newValue) {
                  onUnitChanged(newValue!);
                },
                items: unitList.map((String unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(' $unit',
                        style: GoogleFonts.poppins(
                            fontSize: 16)), // Customize text style
                  );
                }).toList(),
                style: const TextStyle(
                  color: Colors
                      .black, // Customize the text color of the selected item
                  fontSize:
                      16.0, // Customize the text size of the selected item
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Customize border radius
                    borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0), // Customize border color and width
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 16.0), // Customize content padding
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
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

  const IngredientsList({super.key, required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
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

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const InputField(
      {super.key,
      required this.controller,
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
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: controller,
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
