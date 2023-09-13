import 'package:cs426final/app/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SetAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SetAccountPage(),
    );
  }
}

class SetAccountPage extends StatefulWidget {
  @override
  _SetAccountState createState() => _SetAccountState();
}

class _SetAccountState extends State<SetAccountPage> {
  DateTime selectedDate = DateTime.now();
  Country? _selectedCountry;

  static final Color customColor = Color(0xFFE25E3E);
  final TextEditingController _fullNameController = TextEditingController();

  bool _isObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _onCountrySelected(Country country) {
    setState(() {
      _selectedCountry = country;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 122),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center horizontally
                children: [
                  Text('Set up your account',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24))),
                ],
              ),
            ),
            SizedBox(height: 56),
            Container(
                width: 310,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 43.0, // Adjust the height of the email input box
                      child: TextField(
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          hintText: 'antihcmus',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 14)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFD9D9D9), width: 2.0),
                            borderRadius: BorderRadius.circular(
                                20.0), // Add rounded corners
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(
                                20.0), // Add rounded corners
                          ),
                          // Adjust padding
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 16),
            Container(
                width: 310,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date of birth',
                      style:
                          GoogleFonts.inter(textStyle: TextStyle(fontSize: 14)),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: TextField(
                        readOnly: true, // Make the text field read-only
                        controller: TextEditingController(
                          text:
                              "${DateFormat('MMMM dd, yyyy').format(selectedDate)}",
                        ),
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 13)),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            hoverColor: Color(0xFFE25E3E),
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFD9D9D9), width: 2.0),
                            borderRadius: BorderRadius.circular(
                                20.0), // Add rounded corners
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(
                                20.0), // Add rounded corners
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 16),
            Container(
              width: 310,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country',
                    style:
                        GoogleFonts.inter(textStyle: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(height: 15),
                  Container(
                    // Adjust the height of the country input box
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: _onCountrySelected,
                          // Optionally hide currency
                        );
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFD9D9D9), width: 2.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _selectedCountry?.name ?? 'Select Country',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 13)),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                width: 310,
                height: 43,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(NavigationBarRoute());
                  },
                  child: Text('Continue',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ))),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(customColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            25.0), // Adjust the radius as needed
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
