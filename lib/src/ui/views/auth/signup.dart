import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktokclone/src/res/colors.dart';
import 'package:tiktokclone/src/res/styles.dart';
import 'package:tiktokclone/src/ui/views/components/button.dart';
import 'package:tiktokclone/src/ui/views/components/text_input.dart';
import 'package:tiktokclone/src/utils/constants.dart';
import 'package:tiktokclone/src/utils/navigations.dart';

class SignUP extends StatelessWidget {
  SignUP({Key? key}) : super(key: key);

  final TextEditingController _usernameConttroller = TextEditingController();
  final TextEditingController _emailConttroller = TextEditingController();
  final TextEditingController _passConttroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => AppRoute.pop(context),
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                'Register',
                style: GoogleFonts.nunito(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(Constants.proImg),
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _usernameConttroller,
                labelText: 'Username',
                icon: Icons.person,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailConttroller,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            const SizedBox(height: 15),
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
              label: 'Sign Up',
              press: () {},
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have an account?',
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => AppRoute.pop(context),
                  child: Text(
                    'Login',
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
