import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/src/res/colors.dart';
import 'package:tiktokclone/src/ui/views/confirm.dart';
import 'package:tiktokclone/src/utils/navigations.dart';

class AddVideos extends StatelessWidget {
  const AddVideos({Key? key}) : super(key: key);

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          sDOption(
            'Camera',
            Icons.camera_alt,
            () => pickVideo(ImageSource.camera, context),
          ),
          sDOption(
            'Gallery',
            Icons.image,
            () => pickVideo(ImageSource.gallery, context),
          ),
          sDOption('Cancel', Icons.cancel, () => AppRoute.pop(context)),
        ],
      ),
    );
  }

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      // AppRoute.navigatePush(
      //   page: const Confirm(),
      //   context: context,
      // );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Confirm(
            vieoFile: File(video.path),
            vieoPath: video.path,
          ),
        ),
      );
    }
  }

  SimpleDialogOption sDOption(
      String title, IconData icon, Function()? pressed) {
    return SimpleDialogOption(
      onPressed: pressed,
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
            ),
            child: Center(
              child: Text(
                'Add Video',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
