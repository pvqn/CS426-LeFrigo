import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/welcomeImg.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'antihcmus',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Vietnam',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 14, color: Color(0xFFD9D9D9))),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 25,
                  ),
                )),
            SizedBox(
              width: 20,
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 5,
            ),
            Column(
              children: [
                Text(
                  'Post',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '1',
                  style:
                      GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Likes',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '10',
                  style:
                      GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Join From',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'August 2023',
                  style:
                      GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 8,
            width: 350,
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
            )),
        SizedBox(
          height: 15,
        ),
        Text(
          'Posts',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF173F4E))),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: PostGridPage(),
        )
      ]),
    );
  }
}

class dummy {
  String image = 'assets/food.png';
  String nameRecipe = 'Greek Yogurt with Chia Pudding';
  int likes = 2000;
}

class PostGridPage extends StatefulWidget {
  @override
  _PostGridPageState createState() => _PostGridPageState();
}

class _PostGridPageState extends State<PostGridPage> {
  List<dummy> items = [
    dummy(),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostGridView(
        items: items,
        onRemove: (int index) {
          setState(() {
            items.removeAt(index);
          });
        },
      ),
    );
  }
}

class PostGridView extends StatelessWidget {
  final List<dummy> items;
  final ValueChanged<int> onRemove;

  PostGridView({required this.items, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 158 / 222,
        crossAxisCount: 2, // Number of columns in the grid
      ),
      itemCount: items.length, // Use the length of your dynamic list
      itemBuilder: (BuildContext context, int index) {
        return PostGridItem(
          item: items[index],
          onRemove: () {
            onRemove(index);
          },
        );
      },
    );
  }
}

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
    return Container(
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
              child: Text(
                item.nameRecipe,
                style: TextStyle(
                  fontFamily: 'InterBold',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
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
                  Text(
                    item.likes.toString(),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
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
    );
  }
}
