import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:lefrigo/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class SummaryTab extends StatefulWidget {
  // TextEditingController recipeName = TextEditingController();
  // TextEditingController description = TextEditingController();

  // TextEditingController totalTime = TextEditingController();
  // TextEditingController serving = TextEditingController();
  // TextEditingController prepTime = TextEditingController();
  // TextEditingController cookTime = TextEditingController();

  // TextEditingController cal = TextEditingController();
  // TextEditingController fat = TextEditingController();
  // TextEditingController carb = TextEditingController();
  // TextEditingController protein = TextEditingController();
  // String selectedCategory = 'Dinner Recipes';

  final Function(XFile) onUpdateImage;

  TextEditingController recipeName,
      description,
      totalTime,
      serving,
      prepTime,
      cookTime,
      cal,
      fat,
      carb,
      protein;
  String selectedCategory;
  SummaryTab({
    super.key,
    required this.recipeName,
    required this.description,
    required this.totalTime,
    required this.serving,
    required this.prepTime,
    required this.cookTime,
    required this.cal,
    required this.fat,
    required this.carb,
    required this.protein,
    required this.selectedCategory,
    required this.onUpdateImage,
  });

  @override
  SummaryTabState createState() => SummaryTabState();
}

class SummaryTabState extends State<SummaryTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<RecipeProvider>(context, listen: false)
          .refreshListOfCategories();
    });
  }

  void _onCategoryChanged(String? newValue) {
    setState(() {
      widget.selectedCategory =
          newValue ?? 'Dinner Recipes'; // Handle null case
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            ImageUploadWidget(
              onChange: widget.onUpdateImage,
            ),
            const SizedBox(height: 15),
            InputField(
              controller: widget.recipeName,
              hintText: 'Enter recipe name',
              maxLines: 1,
              labelText: 'Recipe Name',
            ),
            const SizedBox(height: 15),
            InputField(
              controller: widget.description,
              hintText: 'Enter description',
              maxLines: 3,
              labelText: 'Description',
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldHorizontal(
                    controller: widget.totalTime, labelText: 'Total time: '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: widget.serving,
                    hintText: ' ',
                    labelText: 'Servings: '),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldHorizontal(
                    controller: widget.cookTime, labelText: 'Cook time: '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: widget.prepTime, labelText: 'Prep time: '),
              ],
            ),
            const SizedBox(height: 20),
            Text('Category',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            Consumer<RecipeProvider>(builder: (context, recipeProvider, child) {
              final categories = recipeProvider.categories;
              return CategoryDropdown(
                selectedCategory: widget.selectedCategory,
                categories: categories,
                onChanged: _onCategoryChanged,
              );
            }),
            const SizedBox(height: 20),
            Text('Nutritions',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldHorizontal(
                    controller: widget.cal,
                    labelText: 'Calories: ',
                    hintText: ' '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: widget.carb,
                    hintText: ' ',
                    labelText: 'Carbs: '),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldHorizontal(
                    controller: widget.protein,
                    labelText: 'Protein: ',
                    hintText: ' '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: widget.fat, labelText: 'Fat: ', hintText: ' '),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class InputFieldHorizontal extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String labelText;
  final String hintText;

  const InputFieldHorizontal(
      {super.key,
      required this.controller,
      this.maxLines = 1,
      this.hintText = 'mins',
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            labelText,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
            width: 80,
            child: TextField(
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
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ))
      ],
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final String labelText;

  const InputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines = 1,
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
          height: 5,
        ),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
              hintText: hintText,
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

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({super.key, required this.onChange});

  final Function(XFile) onChange;

  @override
  ImageUploadWidgetState createState() => ImageUploadWidgetState();
}

class ImageUploadWidgetState extends State<ImageUploadWidget> {
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    _selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 600,
    );

    if (_selectedImage != null) {
      widget.onChange(_selectedImage!);
    }

    // if (kIsWeb) {
    //   final input = html.FileUploadInputElement()..accept = 'image/*';
    //   input.click();
    //   input.onChange.listen((event) {
    //     final file = input.files!.first;
    //     widget.onChange(file);
    //   });
    // } else {
    //   final picker = ImagePicker();
    //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    //   if (pickedImage != null) {
    //     setState(() {
    //       _selectedImage = File(pickedImage.path);
    //     });
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: DottedBorder(
            color: Colors.grey,
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            padding: const EdgeInsets.all(6),
            strokeWidth: 2,
            dashPattern: const [6, 3],
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Center(
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: kIsWeb
                            ? Image.network(
                                width: double.infinity,
                                _selectedImage!.path,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                width: double.infinity,
                                File(_selectedImage!.path),
                                fit: BoxFit.cover,
                              ),
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo, size: 60, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            'Capture your cover photo',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryDropdown extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      onChanged: onChanged,
      items: categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
