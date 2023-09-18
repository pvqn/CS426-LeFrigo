import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';
import 'package:lefrigo/providers/providers.dart';
import 'package:lefrigo/routes/routes.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

@RoutePage()
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdateProfilePage();
  }
}

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  UpdateProfileState createState() => UpdateProfileState();
}

class UpdateProfileState extends State<UpdateProfilePage> {
  DateTime selectedDate = DateTime.now();
  Country? _selectedCountry;
  XFile? _selectedImage;

  static const Color customColor = Color(0xFFE25E3E);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // bool _isObscured = true;

  // void _togglePasswordVisibility() {
  //   setState(() {
  //     _isObscured = !_isObscured;
  //   });
  // }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final authProvider = Provider.of<AuthProvider>(context);

    print('${authProvider.currentStatus.status == AuthNotifierStatus.logOut}');

    if (authProvider.currentStatus.status == AuthNotifierStatus.logOut) {
      Future.delayed(Duration.zero, () {
        context.router
            .pushAndPopUntil(const WelcomeRoute(), predicate: (_) => false);
      });
    } else if (authProvider.currentStatus.status ==
        AuthNotifierStatus.logOutFailed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                authProvider.currentStatus.message ?? 'Something went wrong'),
          ),
        );
      });
    } else if (authProvider.currentStatus.status ==
        AuthNotifierStatus.updateUserSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Update user successfully'),
          ),
        );
      });
    } else if (authProvider.currentStatus.status ==
        AuthNotifierStatus.updateUserFailed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                authProvider.currentStatus.message ?? 'Something went wrong'),
          ),
        );
      });
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
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildAvatarEditButton(),
            const SizedBox(height: 40),
            _buildTextField(
              'Full Name',
              _fullNameController,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Email',
              _emailController,
            ),
            const SizedBox(height: 16),
            _buildDateOfBirthPicker(),
            const SizedBox(height: 16),
            _buildCountryPicker(),
            const SizedBox(height: 40),
            _buildConfirmButton(),
            const SizedBox(height: 10),
            _buildLogOutButton(),
            const SizedBox(height: 10),
            _buildChangePasswordLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              context.router.pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarEditButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: _selectedImage == null
              ? const AssetImage(
                  'assets/images/welcome_bg.png') // Fallback image
              : kIsWeb
                  ? NetworkImage(_selectedImage!.path) as ImageProvider
                  : FileImage(File(_selectedImage!.path)),
        ),
        InkWell(
          onTap: _pickImage,
          child: const Icon(
            Icons.edit_outlined,
            size: 40,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );

    if (picker == null) return;

    setState(() {
      _selectedImage = picker;
    });

    print(_selectedImage!.path);
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return SizedBox(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 43.0,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: labelText == 'Full Name'
                    ? 'antihcmus'
                    : 'antihcmus@gmail.com',
                hintStyle: GoogleFonts.poppins(fontSize: 13),
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

  Widget _buildDateOfBirthPicker() {
    return SizedBox(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of Birth',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: DateFormat('MMMM dd, yyyy').format(selectedDate),
            ),
            style: GoogleFonts.poppins(fontSize: 13),
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

  Widget _buildCountryPicker() {
    return SizedBox(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Country',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
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
                    style: GoogleFonts.poppins(fontSize: 13),
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

  Widget _buildConfirmButton() {
    return SizedBox(
      width: 350,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          Provider.of<UserProvider>(context, listen: false)
              .updateUser(
            username: _fullNameController.text == ''
                ? null
                : _fullNameController.text,
            email: _emailController.text == '' ? null : _emailController.text,
            dob: selectedDate != DateTime.now() ? selectedDate : null,
            country: _selectedCountry?.nameLocalized,
            avatar: _selectedImage,
          )
              .then((_) {
            Provider.of<UserProvider>(context, listen: false).refreshUser();
          });
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
          'Confirm',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildLogOutButton() {
    return SizedBox(
      width: 350,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          Provider.of<AuthProvider>(context, listen: false).logout();

          // context.router
          //     .pushAndPopUntil(WelcomeRoute(), predicate: (_) => false);
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
          'Log out',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildChangePasswordLink() {
    return GestureDetector(
      onTap: () {
        context.router.push(const ChangePasswordRoute());
      },
      child: Text(
        'Change password',
        style:
            GoogleFonts.poppins(fontSize: 15, color: const Color(0xFF9E9D9D)),
      ),
    );
  }
}
