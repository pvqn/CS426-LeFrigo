part of 'login_screen.dart';

class _EmailInput extends StatefulWidget {
  final Function(String) onChanged;

  const _EmailInput({required this.onChanged});

  @override
  State<_EmailInput> createState() => __EmailInputState();
}

class __EmailInputState extends State<_EmailInput> {
  final _controller = TextEditingController();

  final _textInputBorderStyle = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.gray, width: 2.0),
    borderRadius: BorderRadius.circular(20),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => widget.onChanged(_controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: TextField(
                controller: _controller,
                style: GoogleFonts.poppins(fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'sample@email.com',
                  hintStyle: GoogleFonts.poppins(fontSize: 13),
                  enabledBorder: _textInputBorderStyle,
                  focusedBorder: _textInputBorderStyle,
                  contentPadding: const EdgeInsets.only(left: 15),
                ),
              ),
            ),
          ],
        ));
  }
}

class _PasswordInput extends StatefulWidget {
  final Function(String) onChanged;

  const _PasswordInput({required this.onChanged});

  @override
  State<_PasswordInput> createState() => __PasswordInputState();
}

class __PasswordInputState extends State<_PasswordInput> {
  final _controller = TextEditingController();

  final _textInputBorderStyle = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.gray, width: 2.0),
    borderRadius: BorderRadius.circular(20),
  );

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => widget.onChanged(_controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: TextField(
                obscureText: _isObscure,
                controller: _controller,
                style: GoogleFonts.poppins(fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Input your password',
                  hintStyle: GoogleFonts.poppins(fontSize: 13),
                  enabledBorder: _textInputBorderStyle,
                  focusedBorder: _textInputBorderStyle,
                  contentPadding: const EdgeInsets.only(left: 15),
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => _isObscure = !_isObscure),
                    child: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
