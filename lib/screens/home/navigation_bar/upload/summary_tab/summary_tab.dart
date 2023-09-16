import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class SummaryTab extends StatefulWidget {
  @override
  _SummaryTabState createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  // string image?
  TextEditingController recipeName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController totalTime = TextEditingController();
  TextEditingController serving = TextEditingController();
  final List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  String selectedCategory = 'Category 1'; // Set the default category

  void _onCategoryChanged(String? newValue) {
    setState(() {
      selectedCategory = newValue ?? 'Category 1'; // Handle null case
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            ImageUploadWidget(),
            SizedBox(height: 15),
            InputField(
              controller: recipeName,
              hintText: 'Enter recipe name',
              maxLines: 1,
              labelText: 'Recipe Name',
            ),
            SizedBox(height: 15),
            InputField(
              controller: description,
              hintText: 'Enter description',
              maxLines: 3,
              labelText: 'Description',
            ),
            SizedBox(height: 15),
            InputFieldHorizontal(
                controller: totalTime, labelText: 'Total time (minutes): '),
            SizedBox(height: 15),
            InputFieldHorizontal(controller: serving, labelText: 'Servings: '),
            SizedBox(height: 20),
            Text('Category',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            CategoryDropdown(
              selectedCategory: selectedCategory,
              categories: categories,
              onChanged: _onCategoryChanged,
            ),
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

  InputFieldHorizontal(
      {required this.controller, this.maxLines = 1, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(
          labelText,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        )),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
            width: 200,
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
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

  InputField(
      {required this.controller,
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
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
              hintText: hintText,
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

class ImageUploadWidget extends StatefulWidget {
  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //_getImage
          },
          child: DottedBorder(
            color: Colors.grey,
            borderType: BorderType.RRect,
            radius: Radius.circular(20),
            padding: EdgeInsets.all(6),
            strokeWidth: 2,
            dashPattern: [6, 3], // Adjust the dash pattern as needed
            child: Container(
              width: double.infinity,
              height: 200,
              child: Center(
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.file(
                          _selectedImage!,
                          width: 196, // Adjust the size as needed
                          height: 196, // Adjust the size as needed
                          fit: BoxFit.cover,
                        ),
                      )
                    : Column(
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

  CategoryDropdown({
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
          borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
