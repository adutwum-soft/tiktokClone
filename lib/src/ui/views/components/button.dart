import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktokclone/src/res/colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback press;
  const AppButton({
    Key? key,
    required this.label,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: InkWell(
        onTap: press,
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
