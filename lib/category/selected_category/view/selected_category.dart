import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cs426final/favorite/view/custom_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class SelectCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectCategory(),
    );
  }
}

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  TextEditingController _searchController = TextEditingController();
  final String text = 'Breakfast and Brunch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the start (left)
              children: [
                InkWell(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: MyGridView(),
          ),
        ]),
      ),
    );
  }
}
