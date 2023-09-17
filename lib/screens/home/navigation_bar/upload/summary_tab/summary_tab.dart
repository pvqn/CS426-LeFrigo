import 'dart:io' show File;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:lefrigo/providers/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart'
    as html; // Import the universal_html package

class SummaryTab extends StatefulWidget {
  const SummaryTab({super.key});

  @override
  SummaryTabState createState() => SummaryTabState();
}

class SummaryTabState extends State<SummaryTab> {
  File? _selectedImage;
  TextEditingController recipeName = TextEditingController();
  TextEditingController description = TextEditingController();

  TextEditingController totalTime = TextEditingController();
  TextEditingController serving = TextEditingController();
  TextEditingController prepTime = TextEditingController();
  TextEditingController cookTime = TextEditingController();

  TextEditingController cal = TextEditingController();
  TextEditingController fat = TextEditingController();
  TextEditingController carb = TextEditingController();
  TextEditingController protein = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<RecipeProvider>(context, listen: false)
          .refreshListOfCategories();
    });
  }

  @override
  void dispose() {
    recipeName.dispose();
    description.dispose();
    totalTime.dispose();
    serving.dispose();
    prepTime.dispose();
    cookTime.dispose();
    cal.dispose();
    fat.dispose();
    carb.dispose();
    protein.dispose();
    super.dispose();
  }

  String selectedCategory = 'Dinner Recipes'; // Set the default category

  void _onCategoryChanged(String? newValue) {
    setState(() {
      selectedCategory = newValue ?? 'Dinner Recipes'; // Handle null case
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
              selectedImage: _selectedImage,
            ),
            const SizedBox(height: 15),
            InputField(
              controller: recipeName,
              hintText: 'Enter recipe name',
              maxLines: 1,
              labelText: 'Recipe Name',
            ),
            const SizedBox(height: 15),
            InputField(
              controller: description,
              hintText: 'Enter description',
              maxLines: 3,
              labelText: 'Description',
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldHorizontal(
                    controller: totalTime, labelText: 'Total time: '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: serving,
                    hintText: ' ',
                    labelText: 'Servings: '),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldHorizontal(
                    controller: cookTime, labelText: 'Cook time: '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: prepTime, labelText: 'Prep time: '),
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
                selectedCategory: selectedCategory,
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
                    controller: cal, labelText: 'Calories: ', hintText: ' '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: carb, hintText: ' ', labelText: 'Carbs: '),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldHorizontal(
                    controller: protein, labelText: 'Protein: ', hintText: ' '),
                const SizedBox(width: 5),
                InputFieldHorizontal(
                    controller: fat, labelText: 'Fat: ', hintText: ' '),
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
  ImageUploadWidget({required this.selectedImage});

  final File? selectedImage;

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File? _selectedImage;
  @override
  void initState() {
    _selectedImage = widget.selectedImage;
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final input = html.FileUploadInputElement()..accept = 'image/*';
      input.click();
      input.onChange.listen((event) {
        final file = input.files!.first;
        setState(() {
          _selectedImage = File(html.Url.createObjectUrlFromBlob(file));
        });
      });
    } else {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
    }
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
                                _selectedImage!,
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
