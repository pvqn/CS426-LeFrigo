import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SetAccountScreen extends StatelessWidget {
  const SetAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SetAccountPage();
  }
}

class SetAccountPage extends StatefulWidget {
  const SetAccountPage({super.key});

  @override
  SetAccountState createState() => SetAccountState();
}

class SetAccountState extends State<SetAccountPage> {
  DateTime selectedDate = DateTime.now();
  Country? _selectedCountry;

  static const Color customColor = Color(0xFFE25E3E);
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  // bool _isObscured = true;
  // void _togglePasswordVisibility() {
  //   setState(() {
  //     _isObscured = !_isObscured;
  //   });
  // }

  @override
  void didChangeDependencies() {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.status.state == UserProviderState.updateSuccessed) {
      context.router
          .pushAndPopUntil(const NavigationBarRoute(), predicate: (_) => false);
    } else if (userProvider.status.state == UserProviderState.updateFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              userProvider.status.message ?? 'Something went wrong. Try again'),
        ),
      );
    }

    super.didChangeDependencies();
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
            _buildHeader(),
            const SizedBox(height: 56),
            _buildFullNameField(),
            const SizedBox(height: 16),
            _buildDateOfBirthField(),
            const SizedBox(height: 16),
            _buildCountryField(),
            const SizedBox(height: 50),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 122),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Set up your account',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullNameField() {
    return SizedBox(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 43.0,
            child: TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText: 'antihcmus',
                hintStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateOfBirthField() {
    return SizedBox(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of birth',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: DateFormat('MMMM dd, yyyy').format(selectedDate),
            ),
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 13,
              ),
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                hoverColor: const Color(0xFFE25E3E),
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate(context);
                },
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryField() {
    return SizedBox(
      width: 310,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Country',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                onSelect: _onCountrySelected,
              );
            },
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFD9D9D9), width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedCountry?.name ?? 'Select Country',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return SizedBox(
      width: 310,
      height: 43,
      child: ElevatedButton(
        onPressed: () async {
          if (_fullNameController.text.isEmpty ||
              _selectedCountry == null ||
              selectedDate == DateTime.now()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please fill in all fields'),
              ),
            );
          } else {
            await userProvider.updateUser(
              username: _fullNameController.text,
              country: _selectedCountry?.name,
              dob: selectedDate,
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(customColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text(
          'Continue',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
