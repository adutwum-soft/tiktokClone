import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktokclone/src/res/colors.dart';
import 'package:tiktokclone/src/res/styles.dart';
import 'package:tiktokclone/src/ui/controllers/auth/auth_controller.dart';
import 'package:tiktokclone/src/ui/views/auth/signup.dart';
import 'package:tiktokclone/src/ui/views/components/button.dart';
import 'package:tiktokclone/src/ui/views/components/text_input.dart';
import 'package:tiktokclone/src/utils/navigations.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _emailConttroller = TextEditingController();
  final TextEditingController _passConttroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'TikTok \nClone',
                style: AppStyles.apptitle,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Login',
                style: GoogleFonts.nunito(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailConttroller,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passConttroller,
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              label: 'Login',
              press: () => AuthController.instance.loginUser(
                _emailConttroller.text,
                _passConttroller.text,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => AppRoute.navigatePush(
                    context: context,
                    page: SignUP(),
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
