import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/src/models/user.dart' as userModel;
import 'package:tiktokclone/src/ui/views/auth/login.dart';
import 'package:tiktokclone/src/ui/views/home.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var firebaseAuth = FirebaseAuth.instance;
  var firebaseStorage = FirebaseStorage.instance;
  var firestore = FirebaseFirestore.instance;

  late Rx<File?> _pickedImage;
  late Rx<User?> _user;

  File? get profilePhoto => _pickedImage.value;
  User? get getUser => _user.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => Login());
    } else {
      Get.offAll(() => const Home());
    }
  }

  pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture', 'Picture selected successfully');
      _pickedImage = Rx<File?>(File(pickedImage.path));
    }
  }

  // upload to firebase storage
  Future<String> _uploadToStorage(File img) async {
    Reference ref = firebaseStorage
        .ref()
        .child('prifilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(img);
    TaskSnapshot snapshot = await uploadTask;
    var downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  registerUser(
      String username, String email, String password, File? img) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          img != null) {
        // save user details
        UserCredential userCred =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(img);
        userModel.User user = userModel.User(
          email: email,
          name: username,
          prifilePhoto: downloadUrl,
          uid: userCred.user!.uid,
        );
        await firestore
            .collection('users')
            .doc(userCred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Error', 'Please all fields are required');
      }
    } catch (e) {
      print('>>> firebase:: ${e.toString()} >>>');
      Get.snackbar('Error', e.toString());
    }
  }

  loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print('>> :: Login Success >>');
      } else {
        Get.snackbar('Error Logging in', 'Please all fields are required');
      }
    } catch (e) {
      Get.snackbar('Error Logging in', e.toString());
    }
  }
}
