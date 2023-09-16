import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lefrigo/routes/routes.dart';
import 'model.dart';

class PostGridItem extends StatelessWidget {
  final dummy item;
  final VoidCallback onRemove;

  PostGridItem({required this.item, required this.onRemove});
  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Set the border radius here
          ),
          content: Container(
            width: 337, // Set the desired width
            // Set the desired height
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use min to limit height
              children: [
                Text(
                  'Are you sure?',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.0), // Add vertical space
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Set the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        onRemove(); // Notify parent that removal is confirmed
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(RecipeRoute());
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 158,
        height: 280, // Set a fixed height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        _showRemoveDialog(context);
                      },
                      child: Icon(
                        Icons.delete,
                        size: 20,
                        color: Color(0xFFFF0B0B),
                      ),
                    ),
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Expanded(child: Text('')),
              Container(
                width: double.infinity, // Expand to full width
                child: Text(item.nameRecipe,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity, // Expand to full width
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(item.likes.toString(),
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
