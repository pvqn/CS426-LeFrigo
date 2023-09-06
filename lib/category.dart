import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class CategoryItem extends StatelessWidget {
  final String text;
  final String image;
  final String id;

  CategoryItem({required this.id, required this.text, required this.image});

  Future<Uint8List?> fetchImage(String id) async {
    final response =
        await http.get(Uri.parse('http://52.195.170.49:8888/asset/$id'));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      // Handle errors, e.g., return a placeholder image
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: fetchImage(image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Handle loading state
          return SizedBox(
            height: 162,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          );
        } else if (snapshot.hasError || snapshot.data == null) {
          // Handle error or no data state
          return Icon(Icons.error);
        } else {
          // Data loaded successfully, display the image
          return Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: 350,
            height: 162,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                // Background Image loaded from API
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: MemoryImage(snapshot.data!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Content
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'InterBold',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  List<CategoryItem> itemList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
    print('ok');
  }

  Future<void> fetchCategories() async {
    final response = await http.get(
      Uri.parse('http://52.195.170.49:8888/categories'),
      // Add headers if needed
    );

    if (response.statusCode == 200) {
      print('ok');
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        itemList = data.map((category) {
          return CategoryItem(
            id: category['_id'],
            text: category['name'],
            image: category['imageid'],
          );
        }).toList();
        isLoading = false;
      });
    } else {
      // Handle the error, e.g., show an error message
      print('Failed to fetch categories.');
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                  text: itemList[index].text,
                  image: itemList[index].image,
                  id: itemList[index].id);
            },
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  static final Color customColor = Color(0xFFE25E3E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the start (left)
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            // Use the CategoryListView widget directly
            child: CategoryListView(),
          ),
        ],
      ),
    );
  }
}
