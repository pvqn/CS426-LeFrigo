import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'summary_tab/summary_tab.dart';
import 'ingredient_tab/ingredient_tab.dart';
import 'directions_tab/directions_tab.dart';

@RoutePage()
class UploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              UploadHeader(),
              Expanded(
                child: TabBarView(
                  children: [SummaryTab(), IngredientTab(), DirectionsTab()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 14,
        ),
        Expanded(
          child: GestureDetector(
              onTap: () {
                context.router.pop();
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFE25E3E))),
              )),
        ),
        UploadTabsContent(),
      ],
    );
  }
}

class UploadTabsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          child: TabBar(
            labelColor: Color(0xFFE25E3E),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            tabs: [
              Tab(text: '1'),
              Tab(text: '2'),
              Tab(text: '3'),
            ],
          ),
        ),
      ],
    );
  }
}

class Third1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
