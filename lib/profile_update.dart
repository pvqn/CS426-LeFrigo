import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpdateProfilePage(),
    );
  }
}

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfilePage> {
  DateTime selectedDate = DateTime.now();
  Country? _selectedCountry;

  static final Color customColor = Color(0xFFE25E3E);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius:
                        70, // Adjust the radius to control the size of the circle
                    // Background color of the circle
                    backgroundImage: AssetImage('assets/welcomeImg.png'),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 43.0, // Adjust the height of the email input box
                      child: TextField(
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          hintText: 'antihcmus',
                          hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize:
                                  13 // Apply the same font family to the label text
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
                          // Adjust padding
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 16,
            ),
            Container(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 43.0, // Adjust the height of the email input box
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'antihcmus@gmail.com',
                          hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize:
                                  13 // Apply the same font family to the label text
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
                          // Adjust padding
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 16),
            Container(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date of birth',
                      style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: TextField(
                        readOnly: true, // Make the text field read-only
                        controller: TextEditingController(
                          text:
                              "${DateFormat('MMMM dd, yyyy').format(selectedDate)}",
                        ),
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 13),
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
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country',
                    style: TextStyle(fontFamily: 'InterBold', fontSize: 14),
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
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 13),
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
              height: 40,
            ),
            Container(
                width: 350,
                height: 43,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed behavior here
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
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
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                // Add your click event logic here
              },
              child: Text(
                'Change password',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color(0xFF9E9D9D),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
